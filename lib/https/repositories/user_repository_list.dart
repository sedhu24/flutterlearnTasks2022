import 'dart:math';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutterlearn/constants.dart';
import 'package:flutterlearn/https/response/data.dart';
import 'package:flutterlearn/https/response/user.dart';

class UserRepositoryList {
  static Future<List<UserModel>?> lisUser() async {
    try {
      print('APi : List');

      var url = Uri.parse("https://jsonplaceholder.typicode.com/users");

      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<UserModel> userlist = userModelFromJson(response.body);
        print(userlist);

        return userlist;
      }

      // var formData = FormData.fromMap({
      //   'name': 'wendux',
      //   'age': 25,
      //   'file':
      //       await MultipartFile.fromFile('./text.txt', filename: 'upload.txt')
      // });
      // Map<String, dynamic> dataum = {"name": " "};

      // Response userListData =
      //     await Dio().get("https://jsonplaceholder.typicode.com/users");

      // Response userListData1 = await Dio().get(
      //     Apiconstants.baseUrl + Apiconstants.usersEndpoint,
      //     queryParameters: {"user_id": 1});
      // var userListresponse = userListData.data as List;

      // print('User Info  List :  ${userListData.data}');
      // userList = Data.fromJson(userListData.data as Map<String, dynamic>);
      // userList = Data?.fromJson(userListData.data);
      // userList = UserModel.fromJson(userListData.data as Map<String, dynamic>);
      // print('Userlist name : ${userList.firstName}');
    } catch (e) {
      // log.toString();
      print(e);
    }
  }
}
