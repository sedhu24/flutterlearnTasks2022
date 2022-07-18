import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterlearn/login.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(Splashscreenpage());
}

class Splashscreenpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: 'Splash screen',
      home: Splashpage(),
      debugShowCheckedModeBanner: false,
    ));
  }
}

class Splashpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new Loginpage(),
      backgroundColor: Colors.grey,
      title: new Text('Splash Screen'),
      loadingText: Text("Loading"),
      photoSize: 150.0,
      loaderColor: Colors.red,
    );
  }
}

// class Splashpage extends StatefulWidget {
//   @override
//   Splashscreenstate createState() => Splashscreenstate();
// }

// class Splashscreenstate extends State<Splashpage> {
//   void iniState() {
//     super.initState();
//
//     Timer(
//         Duration(seconds: 5),
//         () => Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => Loginpage())));
//
//     Timer(
//         Duration(seconds: 2),
//         () => Navigator.pushReplacement(context,
//             MaterialPageRoute(builder: (BuildContext context) => Loginpage())));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//           body: Center(
//         child: (Container(
//           child: Text('Splash screen'),
//         )),
//       )),
//     );
//   }
// }
