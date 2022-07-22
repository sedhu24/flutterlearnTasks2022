import 'package:dio/dio.dart';
import 'package:flutterlearn/constants.dart';
import 'package:flutterlearn/https/response/users.dart';

import '../response/post.dart';

class PostRepository {
  static Future<List<PostModel>?> getPost() async {
    Response response =
        await Dio().get(Apiconstants.baseUrl + Apiconstants.postEndpoint);
    if (response.statusCode == 200) {
      var getPostData = response.data as List;
      var listPost = getPostData.map((i) => PostModel.fromJson(i)).toList();
      return listPost;
    } else {
      print('Response Error');
    }
  }
}
