import 'dart:math';
import 'dart:developer' as developer;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterlearn/https/repositories/post_repository.dart';

import 'package:flutterlearn/https/repositories/user_repository.dart';
import 'package:flutterlearn/https/response/post.dart';
import 'package:flutterlearn/https/response/users.dart';

class Screenone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Listviewpage(),
    ));
  }
}

class Listviewpage extends StatefulWidget {
  @override
  listviewpage createState() => listviewpage();
}

class listviewpage extends State<Listviewpage> {
  List<UserModel>? userModel = [];
  //
  List<PostModel>? postModel = [];

  Response? response;

  @override
  void initState() {
    super.initState();
    developer.log('getUserModel');
    getPostModel();
    // getData();
  }

  getPostModel() async {
    developer.log('getUserModel');
    // PostRepository postRepository = PostRepository();
    postModel = await PostRepository.getPost();
    developer.log('getUserModel');
    // print(response?.data[0]);
  }

  // getUserModel() async {
  //   userModel = (await UserRepository.getUsers());
  //   developer.log('getUserModel');
  //   // print(response?.data[0]);
  // }

  // getUser() async {
  //   response = await UserRepository.fetchUsers();
  //   print(response);
  // }

  // getPost() async {
  //   response = await PostRepository.getPost();
  //   print(response);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: postModel == null || postModel!.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: postModel!.length,
                itemBuilder: (context, index) {
                  return Card(
                      color: Colors.deepOrangeAccent,
                      margin: EdgeInsets.all(5),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.0, color: Colors.white),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Text(postModel![index].id.toString()),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              height: 50,
                              width: 250,
                              child: Text(postModel![index].title),
                            ),
                          ],
                        ),
                      ));
                })
        // FutureBuilder<List<PostModel>>(
        //     future: Future.error(Object),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         return ListView.separated(
        //             itemBuilder: (context, index) {
        //               var post = (snapshot.data as List<PostModel>)[index];
        //               return Container(
        //                 padding: EdgeInsets.all(10),
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: <Widget>[
        //                     Text(post.body,
        //                         style: TextStyle(
        //                             fontWeight: FontWeight.bold, fontSize: 20))
        //                   ],
        //                 ),
        //               );
        //             },
        //             separatorBuilder: (context, index) {
        //               return Divider();
        //             },
        //             itemCount: (snapshot.data as List<PostModel>).length);
        //       } else if (snapshot.hasError) {
        //         return Center(
        //           child: Text("${snapshot.error}"),
        //         );
        //       }
        //       return Center(
        //         child: CircularProgressIndicator(
        //           backgroundColor: Colors.cyanAccent,
        //         ),
        //       );
        //     }),
        );
  }
}
