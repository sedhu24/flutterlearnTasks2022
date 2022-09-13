import 'dart:math';
import 'dart:developer' as developer;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterlearn/https/repositories/user_repository_resapi.dart';
import 'package:flutterlearn/https/response/resapiresponse/resdatum.dart';

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

  late Map<String, dynamic>? datumlist = [] as Map<String, dynamic>;

  @override
  void initState() {
    super.initState();
    getdata();
  }

  void getdata() async {
    datumlist = (await UserRepositoryResApi.getlistdata());
    // print(datumlist);
    Future.delayed(const Duration(seconds: 2)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: datumlist == null || datumlist!.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                    color: Colors.amber, backgroundColor: Colors.cyan),
              )
            : ListView.builder(
                itemCount: datumlist!.length,
                itemBuilder: (context, index) {
                  return Container();
                  // return ListTile(
                  //   title: Text(datumlist![1]['first_name']),
                  // );
                })

        // Column(mainAxisSize: MainAxisSize.min, children: [
        //   // Expanded(
        //   //   child: ListView.builder(
        //   //       shrinkWrap: true,
        //   //       itemCount: datumlist?.length,
        //   //       itemBuilder: (context, index) {
        //   //         return ListTile(
        //   //             // title: Text(datumlist![index].lastName),
        //   //             );
        //   //       }
        //   //
        //   //       //     Card(
        //   //       //       color: Colors.deepOrange,
        //   //       //       child: Column(children: [Text(datumlist![index].email)]));
        //   //       //   //   Row(
        //   //       //   //     mainAxisAlignment: MainAxisAlignment.center,
        //   //       //   //     children: [Text(datumlist![index].lastName)],
        //   //       //   //   ),
        //   //       //   // );
        //   //       // },
        //   //
        //   //       // FutureBuilder<UserModel?>(
        //   //       //     future: UserRepository.getUser(id: '10'),
        //   //       //     builder: (context, index) {
        //   //       //       if (index.hasData) {
        //   //       //         UserModel? userInfo = index.data;
        //   //       //         if (userInfo != null) {
        //   //       //           return Column(
        //   //       //             mainAxisSize: MainAxisSize.min,
        //   //       //             children: [
        //   //       //               Text(userInfo.name),
        //   //       //               SizedBox(
        //   //       //                 height: 8.0,
        //   //       //               ),
        //   //       //               Text(
        //   //       //                 '${userInfo.email}',
        //   //       //                 style: TextStyle(
        //   //       //                     fontSize: 16.0,
        //   //       //                     color: Colors.black,
        //   //       //                     fontStyle: FontStyle.italic),
        //   //       //               ),
        //   //       //             ],
        //   //       //           );
        //   //       //         }
        //   //       //       }
        //   //       //       return CircularProgressIndicator(
        //   //       //         color: Colors.amber,
        //   //       //         backgroundColor: Colors.blueAccent,
        //   //       //       );
        //   //       //     }
        //   //       //     ),
        //   //       ),
        //   // ),
        // ])
        );
  }
}
