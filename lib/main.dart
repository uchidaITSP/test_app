import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/root.dart';
import 'package:test_app/screen/login_screen.dart';


void main() => runApp(new Login());

//  ルートの分岐の準備 '/' がないと起動時に実行するルートがわからず、エラーになる
final routes = {
  '/': (BuildContext context) => new LoginPage(), // routesが '/' だから最初に実行されるもの
};

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sqflite App',
      theme: new ThemeData(primarySwatch: Colors.blue),
      routes: routes,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
            bottomNavigationBar: RootWidget(),
          ),
      );
  }
}