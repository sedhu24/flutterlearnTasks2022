import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutterlearn/constants.dart';
import 'package:flutterlearn/https/response/users.dart';

class UserRepository {
  static Future<List<UserModel>?> getUsers() async {
    Response response =
        await Dio().get(Apiconstants.baseUrl + Apiconstants.usersEndpoint);

    if (response.statusCode == 200) {
      var getUserData = response.data as List;
      var listUser = getUserData.map((i) => UserModel.fromJson(i)).toList();
      return listUser;
    } else {
      print('Response Error');
    }

    // var url = Uri.parse(Apiconstants.baseUrl + Apiconstants.usersEndpoint);
    // var response = await http.get(url);
    //
    // if (response.statusCode == 200) {
    //   List<UserModel> model = userModelFromJson(response.body);
    //   return model;
    // }
  }
}
