import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/controller/helper/api_helper.dart';
import 'package:wallpaper_app/models/post_api_model.dart';

import '../../controller/api_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  late int num;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("API Calling"),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder(
            future: APiHelper.apiHelper.getMultipleResponse(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                List<PostAPI> allPostAPI = snapShot.data!;
                return ListView.builder(
                  itemCount: allPostAPI.length,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      leading: Text(allPostAPI[index].id.toString()),
                      title: Text(
                        allPostAPI[index].title,
                        maxLines: 1,
                      ),
                      subtitle: Text(
                        allPostAPI[index].body,
                        maxLines: 2,
                      ),
                    ),
                  ),
                );
              } else if (snapShot.hasError) {
                return Text("ERROR : ${snapShot.error}");
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        )
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
        //           controller: provider.textController,
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
