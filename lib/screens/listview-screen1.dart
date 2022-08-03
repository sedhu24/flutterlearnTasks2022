import 'dart:math';
import 'dart:developer' as developer;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterlearn/constants.dart';

import 'package:flutterlearn/https/repositories/user_repository.dart';
import 'package:flutterlearn/https/response/data.dart';
import 'package:flutterlearn/https/response/user.dart';

class Screenone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.black12,
      home: Listviewpage(),
    ));
  }
}

class Listviewpage extends StatefulWidget {
  @override
  listviewpage createState() => listviewpage();
}

class listviewpage extends State<Listviewpage> {
  // final Apiconstants client = Apiconstants();

  @override
  void initState() {
    super.initState();
    // getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: FutureBuilder<UserModel?>(
                future: UserRepository.getUser(id: '3'),
                builder: (context, index) {
                  if (index.hasData) {
                    UserModel? userInfo = index.data;
                    if (userInfo != null) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(userInfo.username),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            '${userInfo.email}',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      );
                    }
                  }
                  return CircularProgressIndicator();
                })));
  }
}
