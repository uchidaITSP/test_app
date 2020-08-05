import 'package:flutter/material.dart';
import 'package:test_app/main.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class Top extends StatelessWidget {

  final _currentPageNotifier = ValueNotifier<int>(0);

  final controller = PageController(
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(

        ),
           body: PageView(
           children:[
             _centerArea(),
             _menu1(),
             _menu2(),
             _menu3(),
             _menu4(),
             _menu5(),

           ]
           )
      )
    );
  }
}

class _centerArea extends StatelessWidget {
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
      return Scaffold(

          body: Center(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 250, 0, 0),
                  child: Column(
                  children: <Widget>[
                      Text('CLINICS', style: TextStyle(
                        fontSize: 40,
                        color: Colors.black
                      ),),
                      Text('オンライン診療アプリ「クリ二クス」'),
                  ]
                  )
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 130, 0, 0),
                  child: FlatButton(
                    child: Text("ログイン"),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login()
                          )
                      );
                    },

                    padding: EdgeInsets.fromLTRB(120, 8, 120, 8),
                    color: Colors.red,
                    textColor: Colors.white,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: FlatButton(
                    child: Text("アカウント登録"),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login()
                          )
                      );
                    },

                    padding: EdgeInsets.fromLTRB(100, 8, 100, 8),
                    color: Colors.black12,
                    textColor: Colors.black,
                  ),
                ),
                Container(
                  height: 30.0,
                  child: CirclePageIndicator(
                    itemCount: 6,
                    currentPageNotifier: _currentPageNotifier,
                  ),
                ),
              ]
          )
          )
      );
  }
}

class _menu1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                    child: SizedBox(
                      width: 300,
                      height: 250,
                      child: FlatButton(
                        color: Colors.black12,
                        onPressed: () {
                        },
                        child: Text("オンライン診療アプリとは"),
                      ),
                    ),
                  ),
                  Container(
                    child: SizedBox(
                      width: 300,
                      height: 150,
                      child: Text("オンライン診療アプリとは、予約から診察、会計までを行うことができる新しい通院のかたちです。",style: TextStyle(
                          fontSize: 17,
                          color: Colors.black54
                      ),),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                    child: RaisedButton(
                      child: Text("次へ"),
                      textColor: Colors.white,
                      color: Colors.red,
                      shape: StadiumBorder(),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            )
                        );
                      },
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    ),
                  ),
                ]
            )
        )
    );
  }
}

class _menu2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: FlatButton(
                        color: Colors.black12,
                        onPressed: () {
                        },
                        child: Text("診察予約"),
                      ),
                    ),
                  ),
                  Container(
                    child: SizedBox(
                      width: 300,
                      height: 100,
                      child: Text("かかりつけの病院・クリニックをさがして、診察予約をしましょう。保険証ではカメラで撮影して提出でき、問診票もアプリで回答できます。",style: TextStyle(
                          fontSize: 17,
                          color: Colors.black54
                      ),),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                    child: RaisedButton(
                      child: Text("次へ"),
                      textColor: Colors.white,
                      color: Colors.red,
                      shape: StadiumBorder(),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            )
                        );
                      },
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    ),
                  ),
                ]
            )
        )
    );
  }
}

class _menu3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: FlatButton(
                        color: Colors.black12,
                        onPressed: () {
                        },
                        child: Text("診察"),
                      ),
                    ),
                  ),
                  Container(
                    child: SizedBox(
                      width: 300,
                      height: 100,
                      child: Text("予約時間になったらビデオチャットで医師の診察を受けられます。通院のための移動時間や待合室での待ち時間を気にする必要はありません。",style: TextStyle(
                          fontSize: 17,
                          color: Colors.black54
                      ),),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                    child: RaisedButton(
                      child: Text("次へ"),
                      textColor: Colors.white,
                      color: Colors.red,
                      shape: StadiumBorder(),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            )
                        );
                      },
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    ),
                  ),
                ]
            )
        )
    );
  }
}

class _menu4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: FlatButton(
                        color: Colors.black12,
                        onPressed: () {
                        },
                        child: Text("会計"),
                      ),
                    ),
                  ),
                  Container(
                    child: SizedBox(
                      width: 300,
                      height: 100,
                      child: Text("会計の順番を待ったり、事前に現金を用意しなくても、診察後にクレジットカードで会計が完了します。",style: TextStyle(
                          fontSize: 17,
                          color: Colors.black54
                      ),),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                    child: RaisedButton(
                      child: Text("次へ"),
                      textColor: Colors.white,
                      color: Colors.red,
                      shape: StadiumBorder(),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            )
                        );
                      },
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    ),
                  ),
                ]
            )
        )
    );
  }
}

class _menu5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: FlatButton(
                        color: Colors.black12,
                        onPressed: () {
                        },
                        child: Text("薬・処方せんの配送"),
                      ),
                    ),
                  ),
                  Container(
                    child: SizedBox(
                      width: 300,
                      height: 100,
                      child: Text("薬や処方せんは登録した住所までお届け。今までにない新しい通院のスタイルがオンライン診療アプリCLINICSです。",style: TextStyle(
                          fontSize: 17,
                          color: Colors.black54
                      ),),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                    child: RaisedButton(
                      child: Text("アカウント登録"),
                      textColor: Colors.white,
                      color: Colors.red,
                      shape: StadiumBorder(),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            )
                        );
                      },
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    ),
                  ),
                ]
            )
        )
    );
  }
}