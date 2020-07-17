import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/main.dart';
import 'package:test_app/routes/home_route.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<Login> {
  var _userController = TextEditingController();
  var _passwordController = TextEditingController();
  var _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            Text('Login'),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Text('Username: '),
                ),
                Expanded(
                  flex: 7,
                  child: TextField(
                    controller: _userController,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Text('Password: '),
                ),
                Expanded(
                  flex: 7,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: RaisedButton(
                child: Text('ログイン'),
                onPressed: () async{
//            ボタン押下時の処理
//          Navigator.pushNamed(context, '/next');
//                とりあえず繋げただけ
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                ),
               );
              },
//                _textに
//                onPressed: () => setState(
//                      () {
////                    _text = _userController.text;
////                    _text += ':';
////                    _text += _passwordController.text;
//                  },
//                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text(_text),
            )
          ],
        ),
      ),
    );
  }
}