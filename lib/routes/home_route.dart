

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:test_app/models/user.dart';
import 'package:test_app/routes/search_route.dart';

//QRコードスキャン機能
class ScanPage extends StatefulWidget {
  @override
  _buttonArea createState() => _buttonArea();
}

class Home extends StatelessWidget { // <- (※1)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('CLINIX'),
                )
              ],
            )
        ),
        body: Container(
//        width: 350,
//        height: 250,
//        color: Colors.black12,
          margin: EdgeInsets.all(30),
//        padding: EdgeInsets.fromLTRB(20,60,20,20),
          child: Column(

//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _topArea(),
              _titleArea(),
              ScanPage(),
              _bottomArea()
            ],
          ),
        ),
      ),
    );
  }
}

class _topArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 250,
        color: Colors.black12,
        padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
        child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('体調はいかがですか', style: TextStyle(
                          fontSize: 25,
                          color: Colors.black45
                      ),),
                      Text('医療機関をさがして診察予約しましょう'),
                      RaisedButton(
                        child: Text("医療機関をさがす"),
                        textColor: Colors.white,
                        color: Colors.red,
                        shape: StadiumBorder(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Search(),
                            )
                          );
                        },
                      ),
                    ]
                ),
              )
            ]
        )
    );
  }
}

class _titleArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 100,
      color: Colors.black12,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      padding: EdgeInsets.fromLTRB(10, 28, 10, 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: Text('最寄りの医療機関'),
                ),
                Container(
                  child: Text('医療法人 内科医院'),
                )
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
          )
        ],
      ),
    );
  }
}

class _buttonArea extends State<ScanPage> {

  String qrCodeResult = "何もありません";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 100,
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Icon(Icons.location_on),
                Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  child: Text('現在地からさがす'),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Icon(Icons.center_focus_weak),
                FlatButton(
                  child: Text('QRコードで探す'),
                  onPressed: () async{
                    //QRコード機能実装
                    String codeSander = await BarcodeScanner.scan();
                    setState(() {
                      qrCodeResult = codeSander;
                    });
                  },

                )
//                Container(
//                  margin: const EdgeInsets.only(top: 15.0),
//                  child: Text('QRコードでさがす'),
//                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _bottomArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("はじめてご利用される方へ"),
                textColor: Colors.black,
                color: Colors.white,
                shape: StadiumBorder(),
                onPressed: () {},
              ),
            ]
        )
    );
  }
}