import 'package:flutter/material.dart';
import 'package:wallpaper_app/controller/helper/api_helper.dart';
import 'package:wallpaper_app/models/post_api_model.dart';

class APiController extends ChangeNotifier {
  PostAPI? postAPI;

  List wallpaperData = [];

  APiController() {
    searchWallpaper();
  }

  Future<void> getAPiData({required int apiNumber}) async {
    postAPI =
        await APiHelper.apiHelper.getAPiSingleResponse(apiNumber: apiNumber);
    notifyListeners();
  }

  searchWallpaper({String wallpaperApi = "flowers"}) async {
    wallpaperData =
        await APiHelper.apiHelper.getWallpaper(query: wallpaperApi) ?? [];
    notifyListeners();
  }
}
