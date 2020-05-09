import 'package:flutter/material.dart';
import 'package:phoneauth/homepage.dart';
import 'package:phoneauth/phone_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      routes: {
        '/loginpage' : (BuildContext context) => Dash(),
      },
    );
  }
}
