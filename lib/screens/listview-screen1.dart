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
                    margin: EdgeInsets.all(5),
                    child: Column(
                      children: <Widget>[
                        Text(
                          postModel![index].title,
                          textAlign: TextAlign.left,
                        ),

                        // Flexible(
                        //     flex: 1,
                        //     fit: FlexFit.tight,
                        //     child: Container(
                        //       child: Text(postModel![index].title),
                        //       height: 20,
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(10),
                        //         color: Colors.black12,
                        //       ),
                        //     )),

                        // Flexible(child: Text(postModel![index].title)),

                        //
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     Text(postModel![index].id.toString()),
                        //     Text(
                        //       postModel![index].title,
                        //     ),
                        //   ],
                        // ),

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     Text(postModel![index].body),
                        //   ],
                        // )
                      ],
                    ),
                  );
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
