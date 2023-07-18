import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app/models/post_api_model.dart';

class APiHelper {
  APiHelper._();

  static final APiHelper apiHelper = APiHelper._();

  // String api = "https://jsonplaceholder.typicode.com/posts/4";

  Future<PostAPI?> getAPiSingleResponse({required int apiNumber}) async {
    http.Response response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/$apiNumber"));

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);

      PostAPI postAPI = PostAPI.fromMap(data: data);

      return postAPI;
    }
    return null;
  }
}
