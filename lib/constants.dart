import 'package:dio/dio.dart';

class Apiconstants {
  static Dio dio = Dio();
  static String baseUrl = "https://reqres.in/api/";
  static String usersEndpoint = 'users/';
  static String postEndpoint = '/posts/1';
}
