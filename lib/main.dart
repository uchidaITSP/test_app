import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test_app/root.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: RootWidget(),
      ),
    );
  }
}

//Widget _topArea() {
//  return Container(
//      width: 350,
//      height: 250,
//      color: Colors.black12,
//      padding: EdgeInsets.fromLTRB(20,60,20,20),
//    child: Column(
//        children: <Widget>[
//            Expanded(
//              child: Column(
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Text('体調はいかがですか',style: TextStyle(
//                    fontSize: 25,
//                    color: Colors.black45
//                ),),
//                Text('医療機関をさがして診察予約しましょう'),
//                RaisedButton(
//                  child: Text("医療機関をさがす"),
//                  textColor: Colors.white,
//                  color: Colors.red,
//                  shape: StadiumBorder(),
//                  onPressed: () {},
//                ),
//                ]
//              ),
//            )
//          ]
//    )
//  );
//}
//
//Widget _titleArea(){
//  return Container(
//    width: 350,
//    height: 100,
//    color: Colors.black12,
//    margin: EdgeInsets.fromLTRB(0,10,0,0),
//    padding: EdgeInsets.fromLTRB(10, 28, 10, 10),
//    child: Row(
//      children: <Widget>[
//        Expanded(
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Container(
//                margin: const EdgeInsets.only(bottom: 10.0),
//                child: Text('最寄りの医療機関'),
//              ),
//              Container(
//                child: Text('医療法人 内科医院'),
//              )
//            ],
//          ),
//        ),
//        Icon(
//           Icons.arrow_forward_ios ,
//        )
//      ],
//    ),
//  );
//}
//
//Widget _buttonArea(){
//  return Container(
//    width: 350,
//    height: 100,
//    margin: EdgeInsets.fromLTRB(0,20,0,0),
//    child: Row(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        children: <Widget>[
//          Expanded(
//            child: Column(
//              children: <Widget>[
//                Icon(Icons.star),
//                Container(
//                  margin: const EdgeInsets.only(top: 15.0),
//                  child: Text('現在地からさがす'),
//                )
//              ],
//            ),
//          ),
//          Expanded(
//            child: Column(
//              children: <Widget>[
//                Icon(Icons.star),
//                Container(
//                  margin: const EdgeInsets.only(top: 15.0),
//                  child: Text('QRコードでさがす'),
//                )
//              ],
//            ),
//          )
//        ],
//    ),
//  );
//}
//
//Widget _bottomArea(){
//  return Container(
//    child: Column(
//        children: <Widget>[
//          RaisedButton(
//            child: Text("はじめてご利用される方へ"),
//            textColor: Colors.black,
//            color: Colors.white,
//            shape: StadiumBorder(),
//            onPressed: () {},
//          ),
//        ]
//    )
//  );
//}
