import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/controller/helper/api_helper.dart';
import 'package:wallpaper_app/models/post_api_model.dart';

import '../../controller/api_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("API Calling"),
          centerTitle: true,
        ),
        body: Consumer<APiController>(builder: (context, provider, _) {
          List wallpapers = provider.wallpaperData!;
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Search Wallpaper",
                    ),
                    onSubmitted: (value) {
                      print("VALUE = $value ................");
                      provider.searchWallpaper(wallpaperApi: value);
                    },
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
            // child: FutureBuilder(
            //   future: APiHelper.apiHelper.getMultipleResponse(),
            //   builder: (context, snapShot) {
            //     if (snapShot.hasData) {
            //       List<PostAPI> allPostAPI = snapShot.data!;
            //       return ListView.builder(
            //         itemCount: allPostAPI.length,
            //         itemBuilder: (context, index) => Card(
            //           child: ListTile(
            //             leading: Text(allPostAPI[index].id.toString()),
            //             title: Text(
            //               allPostAPI[index].title,
            //               maxLines: 1,
            //             ),
            //             subtitle: Text(
            //               allPostAPI[index].body,
            //               maxLines: 2,
            //             ),
            //           ),
            //         ),
            //       );
            //     } else if (snapShot.hasError) {
            //       return Text("ERROR : ${snapShot.error}");
            //     } else {
            //       return const CircularProgressIndicator();
            //     }
            //   },
            // ),
          );
        })
        // Consumer<APiController>(
        //   builder: (context,provider,child) {
        //     return Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         provider.postAPI != null
        //             ? ListTile(
        //                 leading: Text(provider.postAPI!.id.toString()),
        //                 title: Text(provider.postAPI!.title),
        //                 subtitle: Text(provider.postAPI!.body),
        //               )
        //             : const Center(
        //                 child: CircularProgressIndicator(),
        //               ),
        //         TextField(
        //           keyboardType: TextInputType.number,
        //           decoration: const InputDecoration(
        //             border: OutlineInputBorder(
        //             ),
        //             hintText: "Enter APi Number",
        //           ),
        //           onSubmitted: (value) {
        //             num = int.parse(value);
        //             provider.getAPiData(apiNumber: num);
        //           },
        //         ),
        //       ],
        //     );
        //   }
        // ),
        );
  }
}
