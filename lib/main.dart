import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasecrud/signinform/Loginpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firbase.dart';
import 'signinform/Loginpage.dart';
import 'signinform/Loginpage.dart';
import 'signinform/Loginpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
home: CheckAuth(),);
  }
}


class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => new _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {

  @override
  Widget build(BuildContext context) {
//    return isLoggedIn ? new MyApp1() : new home();
  return StreamBuilder<FirebaseUser>(
    stream: FirebaseAuth.instance.onAuthStateChanged,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.active) {
        FirebaseUser user = snapshot.data;
        if (user == null) {
          return MyApp1();
        }
        return home();
      } else {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    },
  );
  }
}
