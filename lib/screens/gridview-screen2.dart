import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Screentwo extends StatefulWidget {
  @override
  _ScreenTwo createState() => _ScreenTwo();
}

class _ScreenTwo extends State<Screentwo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('POSTS'),
        ),
        body: Container(
            // Text(_data),
            )
        //  ListView.builder(
        //     itemCount: _data == null ? 0 : _data.length,
        //     itemBuilder: (context, index) {
        //       final item = _data[index];
        //       return ListTile(
        //           title: Text(
        //             item.title,
        //             style: TextStyle(fontSize: 18, color: Colors.black87),
        //           ),
        //           subtitle: Padding(
        //             padding: EdgeInsets.only(top: 10),
        //             child: Text(item.body,
        //                 style: TextStyle(fontSize: 14, color: Colors.grey)),
        //           ));
        //     }),
        );
  }
}
