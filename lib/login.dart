import 'package:flutter/material.dart';
import 'package:flutterlearn/signup.dart';

class Loginpage extends StatelessWidget {
  String title = "Login Screen";

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                margin: EdgeInsets.only(top: 20),
              ),
              Container(
                child: Image.asset('assets/images/6343845.jpg'),
                height: 300,
                width: 300,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.black45),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2)),
                      filled: true,
                      fillColor: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black45),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2)),
                      filled: true,
                      fillColor: Colors.white),
                ),
              ),
              InkWell(
                child: Container(
                  margin: EdgeInsets.only(top: 8),
                  padding: EdgeInsets.all(0),
                  child: Text('Forgot Password ?'),
                ),
                onTap: () {
                  print('Forgot password ? ');
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.all(5),
                child: ElevatedButton(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Signup()),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 5, bottom: 10),
                    child: Text('Does not have account'),
                  ),
                  // Container(
                  //   child: TextButton(
                  //     onPressed: () {},
                  //     child: Text('hello'),
                  //   ),
                  // ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(),
                      margin: EdgeInsets.only(left: 5, bottom: 10),
                      child: Text(
                        'Sign up ?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue),
                      ),
                    ),
                    onTap: () {
                      print('on Tap ');
                      print('on Tap ');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext contex) => Signup()),
                      );

                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Signup()));
                    },
                  ),
                ],
              )
            ],
          )),
        ),
      ),
    ));
  }
}
