import 'dart:convert';

import 'package:flutterlearn/https/response/resapiresponse/resdatum.dart';
import 'package:flutterlearn/https/response/resapiresponse/resuser.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class UserRepositoryResApi {
  static Future<dynamic>? getlistdata() async {
    Response response;
    late Map<String, dynamic>? listdata;

    try {
      var url = Uri.parse("https://reqres.in/api/users?page=2");

      var response = await http.get(url);

      print('response');

      if (response.statusCode == 200) {
        print(response.statusCode);

        listdata = (json.decode(response.body));

        List Listresponse = listdata!['data'];

        print(Listresponse);

        // Jsonresponse.map((e) => Datum.fromJson(e)).toList();

        return listdata;
      }
    } catch (e) {
      print('error ==>');
      print(e);
    }
  }
}
