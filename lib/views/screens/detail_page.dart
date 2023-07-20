import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("SELECT SCREEN"),
              actions: [
                GestureDetector(
                  onTap: () {},
                  child: const Text("HOME SCREEN"),
                ),
                Text("LOCK SCREEN"),
                Text("BOTH"),
              ],
              alignment: Alignment.bottomRight,
            ),
          );
          // showAboutDialog(context: context) {
          //   return AlertDialog(
          //     title: Text("SELECT SCREEN"),
          //     actions: [
          //       GestureDetector(
          //         onTap: () {},
          //         child: const Text("HOME SCREEN"),
          //       ),
          //       Text("LOCK SCREEN"),
          //       Text("BOTH"),
          //     ],
          //     alignment: Alignment.bottomRight,
          //     backgroundColor: Colors.amber,
          //   );
          // }
        },
        child: const Icon(Icons.download_outlined),
      ),
    );
  }
}
