import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app/models/post_api_model.dart';

class APiHelper {
  APiHelper._();

  static final APiHelper apiHelper = APiHelper._();

  String api = "https://jsonplaceholder.typicode.com/posts";

  Future<List?> getWallpaper({String query = "clouds"}) async {
    String wallpaperAPI =
        "https://pixabay.com/api/?key=36873436-b3162e2779ec114a35661b7fa&q=$query";

    http.Response response = await http.get(Uri.parse(wallpaperAPI));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      List allData = data['hits'];

      return allData;
    }
    return null;
  }

  Future<PostAPI?> getAPiSingleResponse({required int apiNumber}) async {
    String api = "https://jsonplaceholder.typicode.com/posts/$apiNumber";
    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);

      PostAPI postAPI = PostAPI.fromMap(data: data);

      return postAPI;
    }
    return null;
  }

  Future<List<PostAPI>?> getMultipleResponse() async {
    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      List allData = jsonDecode(response.body);

      List<PostAPI> allPostAPI =
          allData.map((e) => PostAPI.fromMap(data: e)).toList();

      return allPostAPI;
    }
    return null;
  }
}
