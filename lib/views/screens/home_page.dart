import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:provider/provider.dart';

import '../../controller/api_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallz Hub"),
        centerTitle: true,
      ),
      body: Consumer<APiController>(builder: (context, provider, _) {
        List wallpapers = provider.wallpaperData;
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    hintText: "Search Wallpaper",
                    suffixIcon: const Icon(Icons.search),
                  ),
                  onSubmitted: (value) {
                    print("VALUE = $value ................");
                    provider.searchWallpaper(wallpaperApi: value);
                  },
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    itemCount: wallpapers.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          provider.searchWallpaper(
                              wallpaperApi: wallpapers[index]['type']);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                    wallpapers[index]['largeImageURL'],
                                    height: 50,
                                    width: 100,
                                    fit: BoxFit.cover),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black38,
                                ),
                                alignment: Alignment.center,
                                height: 50,
                                width: 100,
                                child: Text(
                                  wallpapers[index]['type'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: GridView.builder(
                    itemCount: wallpapers.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('detail_page',
                            arguments: wallpapers[index]);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          wallpapers[index]['largeImageURL'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
