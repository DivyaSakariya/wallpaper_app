import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/controller/helper/api_helper.dart';
import 'package:wallpaper_app/models/post_api_model.dart';

class APiController extends ChangeNotifier {
  PostAPI? postAPI;

  List wallpaperData = [];

  // List<Map> imageType = [
  //   {
  //
  //   },
  // ];

  APiController() {
    searchWallpaper();
  }

  Future<void> getAPiData({required int apiNumber}) async {
    postAPI =
    await APiHelper.apiHelper.getAPiSingleResponse(apiNumber: apiNumber);
    notifyListeners();
  }

  searchWallpaper({String wallpaperApi = "all"}) async {
    wallpaperData =
        await APiHelper.apiHelper.getWallpaper(query: wallpaperApi) ?? [];
    notifyListeners();
  }

  setUrlWallpaper({required screen, required String url}) {
    AsyncWallpaper.setWallpaper(
      url: url,
      goToHome: true,
      wallpaperLocation: screen,
      toastDetails: ToastDetails.success(),
      errorToastDetails: ToastDetails.error(),
    );
  }
}
