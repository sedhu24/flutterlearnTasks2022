import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterlearn/https/repositories/user_repository_list.dart';
import 'package:flutterlearn/https/response/data.dart';
import 'package:http/http.dart' as http;

import '../https/response/user.dart';

class Screentwo extends StatefulWidget {
  @override
  _ScreenTwo createState() => _ScreenTwo();
}

class _ScreenTwo extends State<Screentwo> {
  Response? response;
  late List<UserModel>? usermodel = [];
  @override
  void initState() {
    super.initState();
    getUserList();
  }

  void getUserList() async {
    usermodel = (await UserRepositoryList.lisUser())!;
    Future.delayed(const Duration(seconds: 2)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: usermodel == null || usermodel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: usermodel!.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.amberAccent,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: Text(
                                'UserName :' + usermodel![index].username,
                                style: TextStyle(color: Colors.blueGrey),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: Text(
                                'Email : ' + usermodel![index].email,
                                style: TextStyle(color: Colors.blue),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        )
                      ]),
                );
              }),
    );
  }
}
