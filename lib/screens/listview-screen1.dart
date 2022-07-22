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
    getPostModel();
    // getData();
  }

  getPostModel() async {
    // PostRepository postRepository = PostRepository();
    postModel = await PostRepository.getPost();
    print(postModel?.toString());
  }

  getUserModel() async {
    userModel = await UserRepository.getUsers();
    print(userModel?.length);
  }

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
      body: FutureBuilder<List<PostModel>?>(
          future: getPostModel(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    var post = (snapshot.data as List<PostModel>)[index];
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(post.body,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: (snapshot.data as List<PostModel>).length);
            } else if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            }
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.cyanAccent,
              ),
            );
          }),
    );
  }
}
