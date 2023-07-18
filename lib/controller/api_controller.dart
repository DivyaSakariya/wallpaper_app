import 'package:flutter/material.dart';
import 'package:wallpaper_app/controller/helper/api_helper.dart';
import 'package:wallpaper_app/models/post_api_model.dart';

class APiController extends ChangeNotifier {
  PostAPI? postAPI;

  TextEditingController textController = TextEditingController();

  Future<void> getAPiData({required int apiNumber}) async {
    postAPI = await APiHelper.apiHelper.getAPiSingleResponse(apiNumber: apiNumber);
    notifyListeners();
  }
}
