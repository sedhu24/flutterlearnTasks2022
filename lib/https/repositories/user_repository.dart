import 'package:dio/dio.dart';
import 'package:flutterlearn/https/response/data.dart';
import 'package:http/http.dart' as http;
import 'package:flutterlearn/constants.dart';
import 'package:flutterlearn/https/response/user.dart';

class UserRepository {
  static Future<UserModel?> getUser({required String id}) async {
    UserModel? user;

    try {
      print('Api');
      Response userData =
          await Dio().get('https://jsonplaceholder.typicode.com/users/$id');
      print('User Info  :  ${userData.data}');
      user = UserModel.fromJson(userData.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }

    return user;
  }
}
