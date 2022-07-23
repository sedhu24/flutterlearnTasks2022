import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterlearn/home.dart';
import 'package:flutterlearn/https/repositories/post_repository.dart';
import 'package:flutterlearn/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyloginPage extends StatefulWidget {
  @override
  _MyloginPagestate createState() => _MyloginPagestate();
}

class _MyloginPagestate extends State<MyloginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  late SharedPreferences logindata;
  late bool newUser;
  late bool isObsecure = true;

  Response? response;

  @override
  void initState() {
    super.initState();
    // getPost();
    checkifalreadylogin();
  }

  // getPost() async {
  //   response = await PostRepository.getPost();

  //   // print(response);
  // }

  void checkifalreadylogin() async {
    logindata = await SharedPreferences.getInstance();
    newUser = (logindata.getBool('login') ?? true);
    print(newUser);
    if (newUser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Homepage()));
      print(usernameController.text);
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // class handleRememberMe(bool value) async {
  //   isChecked = value;
  //
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //
  //   preferences.setString("username", usernameController.text);
  //
  //   // SharedPreferences.getInstance().then(
  //   //   (userData) {
  //   //     userData.setBool("remeberme", value);
  //   //     userData.setString("email", usernameController.text);
  //   //     userData.setString("password", passwordController.text);
  //   //   },
  //   // );
  //
  //   setState(() {
  //     isChecked = value;
  //   });
  // }

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
                  "Welcome",
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
                  controller: usernameController,
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
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isObsecure,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObsecure = !isObsecure;
                            });
                          },
                          icon: Icon(isObsecure
                              ? Icons.visibility
                              : Icons.visibility_off)),
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     // SizedBox(
              //     //     height: 24.0,
              //     //     width: 24.0,
              //     //     child: Theme(
              //     //       data: ThemeData(
              //     //           unselectedWidgetColor:
              //     //               Color(0xff00C8E8) // Your color
              //     //           ))),
              //     //     //   child: Checkbox(
              //     //     //       activeColor: Color(0xff00C8E8),
              //     //     //       value: isChecked,
              //     //     //       onChanged: handleRememberMe(isChecked)),
              //     //     // )),
              //     SizedBox(width: 10.0),
              //     Text("Remember Me",
              //         style: TextStyle(
              //             color: Color(0xff646464),
              //             fontSize: 12,
              //             fontFamily: 'Rubic'))
              //
              //     // InkWell(
              //     //   child: Container(
              //     //     margin: EdgeInsets.only(top: 8),
              //     //     padding: EdgeInsets.all(0),
              //     //     child: Text('Forgot Password ?'),
              //     //   ),
              //     //   onTap: () {
              //     //     print('Forgot password ? ');
              //     //   },
              //     // ),
              //   ],
              // ),
              Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(
                      color: Colors.blue,
                      width: 4.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextButton(
                  onPressed: () {
                    print('Login Click');
                    String userName = usernameController.text;
                    String password = passwordController.text;
                    if (userName != '' && password != '') {
                      print("Successfull");
                      print(userName);
                      logindata.setBool('login', false);
                      logindata.setString('username', userName);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Homepage()),
                      );
                    } else {
                      print("Failure");
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 5, bottom: 10),
                    child: Text('Does not have account'),
                  ),
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

// class Loginpage extends StatelessWidget {
//   String title = "Login Screen";
//
//   @override
//   Widget build(BuildContext context) {
//     return (MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: title,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             title,
//             textAlign: TextAlign.center,
//           ),
//           centerTitle: true,
//         ),
//         body: SingleChildScrollView(
//           child: Center(
//               child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 child: Text(
//                   'Welcome',
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blue),
//                 ),
//                 margin: EdgeInsets.only(top: 20),
//               ),
//               Container(
//                 child: Image.asset('assets/images/6343845.jpg'),
//                 height: 300,
//                 width: 300,
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 10),
//                 padding: EdgeInsets.all(10),
//                 child: TextField(
//                   decoration: InputDecoration(
//                       labelText: 'Email',
//                       labelStyle: TextStyle(color: Colors.black45),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.blue, width: 2),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue, width: 2)),
//                       filled: true,
//                       fillColor: Colors.white),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 10),
//                 padding: EdgeInsets.all(10),
//                 child: TextField(
//                   keyboardType: TextInputType.visiblePassword,
//                   obscureText: true,
//                   obscuringCharacter: '*',
//                   decoration: InputDecoration(
//                       prefixIcon: IconButton(
//                         icon: Icon(Icons.visibility),
//                         onPressed: () {},
//                       ),
//                       labelText: 'Password',
//                       labelStyle: TextStyle(color: Colors.black45),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.blue, width: 2),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue, width: 2)),
//                       filled: true,
//                       fillColor: Colors.white),
//                 ),
//               ),
//               InkWell(
//                 child: Container(
//                   margin: EdgeInsets.only(top: 8),
//                   padding: EdgeInsets.all(0),
//                   child: Text('Forgot Password ?'),
//                 ),
//                 onTap: () {
//                   print('Forgot password ? ');
//                 },
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 5),
//                 padding: EdgeInsets.all(5),
//                 child: ElevatedButton(
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (BuildContext context) => Signup()),
//                       );
//                     },
//                     child: Text(
//                       'Login',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   onPressed: () {},
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Container(
//                     margin: EdgeInsets.only(left: 5, bottom: 10),
//                     child: Text('Does not have account'),
//                   ),
//                   InkWell(
//                     child: Container(
//                       padding: EdgeInsets.only(),
//                       margin: EdgeInsets.only(left: 5, bottom: 10),
//                       child: Text(
//                         'Sign up ?',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             color: Colors.blue),
//                       ),
//                     ),
//                     onTap: () {
//                       print('on Tap ');
//                       print('on Tap ');
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (BuildContext contex) => Signup()),
//                       );
//
//                       // Navigator.push(context,
//                       //     MaterialPageRoute(builder: (context) => Signup()));
//                     },
//                   ),
//                 ],
//               )
//             ],
//           )),
//         ),
//       ),
//     ));
//   }
// }
