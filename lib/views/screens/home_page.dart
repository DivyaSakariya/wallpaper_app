import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<APiController>(
        builder: (context,provider,child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              provider.postAPI != null
                  ? ListTile(
                      leading: Text(provider.postAPI!.id.toString()),
                      title: Text(provider.postAPI!.title),
                      subtitle: Text(provider.postAPI!.body),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
              TextField(
                controller: provider.textController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  hintText: "Enter APi Number",
                ),
                onSubmitted: (value) {
                  num = int.parse(value);
                  provider.getAPiData(apiNumber: num);
                },
              ),
            ],
          );
        }
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Provider.of<APiController>(context, listen: false).getAPiData(apiNumber: 11);
      //   },
      //   child: const Icon(Icons.download),
      // ),
    );
  }
}
