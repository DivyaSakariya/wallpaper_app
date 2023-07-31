import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/controller/api_controller.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  TextStyle screenTextStyle = const TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallpaper"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.network(data['largeImageURL']),
        ],
      ),
      floatingActionButton: Consumer<APiController>(builder: (context, pro, _) {
        return FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => SizedBox(
                height: 150,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            pro.setUrlWallpaper(
                                screen: AsyncWallpaper.LOCK_SCREEN,
                                url: data['largeImageURL']);
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.lock),
                              const SizedBox(width: 25),
                              Text(
                                "Lock Screen",
                                style: screenTextStyle,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            pro.setUrlWallpaper(
                                screen: AsyncWallpaper.HOME_SCREEN,
                                url: data['largeImageURL']);
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.home),
                              const SizedBox(width: 25),
                              Text(
                                "Home Screen",
                                style: screenTextStyle,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            pro.setUrlWallpaper(
                                screen: AsyncWallpaper.BOTH_SCREENS,
                                url: data['largeImageURL']);
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.done_all),
                              const SizedBox(width: 25),
                              Text(
                                "Lock & Home Both",
                                style: screenTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          child: const Icon(Icons.download_outlined),
        );
      }),
    );
  }
}
