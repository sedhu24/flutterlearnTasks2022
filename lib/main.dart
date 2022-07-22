import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterlearn/login.dart';
// import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: 'Splash screen',
      home: Splashscreenpage(),
      debugShowCheckedModeBanner: false,
    ));
  }
}

// class Splashpage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SplashScreen(
//       seconds: 5,
//       navigateAfterSeconds: new MyloginPage(),
//       backgroundColor: Colors.grey,
//       title: new Text('Splash Screen'),
//       loadingText: Text("Loading"),
//       photoSize: 150.0,
//       loaderColor: Colors.red,
//     );
//   }
// }

class Splashscreenpage extends StatefulWidget {
  @override
  Splashscreenstate createState() => Splashscreenstate();
}

class Splashscreenstate extends State<Splashscreenpage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyloginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: FlutterLogo(size: MediaQuery.of(context).size.height));
  }
}
