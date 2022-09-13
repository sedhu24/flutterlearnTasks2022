import 'package:flutter/material.dart';
import 'package:flutterlearn/login.dart';
import 'package:flutterlearn/screens/gridview-screen2.dart';
import 'package:flutterlearn/screens/listview-screen1.dart';
import 'package:flutterlearn/screens/listviewbuilder-screen3.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  late SharedPreferences logindata;
  late String userName;

  int selectedindex = 0;

  final List screens = [
    {'screen': Screenone(), 'title ': 'screen Listview'},
    {'screen': Screentwo(), 'title ': 'screen Gridview'},
    {'screen': Screenthree(), 'title ': 'screen Listviewbuilder'},
  ];

  void selectedScreen(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      userName = logindata.getString('username')!;
      print("username " + " = " + userName);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Home',
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  logindata.setBool('login', true);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MyloginPage()));
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
        ),
        body: screens[selectedindex]['screen'],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedindex,
          onTap: selectedScreen,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt), label: 'screen A'),
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_on), label: 'Screen B'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Screen C')
          ],
        ),
      ),
    );
  }
}
