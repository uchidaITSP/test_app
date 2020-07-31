import 'package:flutter/material.dart';
import 'package:test_app/main.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:test_app/data/CtrQuery/todo_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_app/models/todo.dart';
import 'package:test_app/view/todo_new/todo_new_view.dart';

class Top extends StatelessWidget {

  final _currentPageNotifier = ValueNotifier<int>(0);

  final controller = PageController(
    initialPage: 1,
  );
//あ
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(

        ),
           body: PageView(
           children: <Widget>[
              Provider<TodoBloc>(
              create: (context) => new TodoBloc(),
              dispose: (context, bloc) => bloc.dispose(),
              child: _centerArea(),
              ),
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
    final _bloc = Provider.of<TodoBloc>(context, listen: false);
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
                  padding: EdgeInsets.fromLTRB(0, 210, 0, 0),
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
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: StreamBuilder<List<Todo>> (
                      stream: _bloc.todoStream,
                      // ignore: missing_return
                      builder: (context, AsyncSnapshot<List<Todo>> snapshot) {
                        if (snapshot.hasData) {
//                 ListView.builderでfor文のような繰り返し処理
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
//                        下のcontainerで回しているitemをどれくらい繰り返すか
                            itemCount: 1,
//                      // ignore: missing_return
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: <Widget>[
                                  Container(
                                    height: 40,
                                    margin: EdgeInsets.fromLTRB(48, 0, 48, 0),
                                    color: Colors.red,
                                    child: ListTile(
                                      title: new Center(child: Text('会員登録',style: TextStyle(
                                          color: Colors.white
                                      )
                                      ),),
                                      onTap: () {
                                        _moveToCreateView(context, _bloc);
                                      },
                                    ),
                                  )
                              ]
                              );
                            }
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      }
                    )

                  
//                  child: FlatButton(
//                    child: Text("アカウント登録"),
//                    onPressed: (){
//                      Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) => Login()
//                          )
//                      );
//                    },
//
//                    padding: EdgeInsets.fromLTRB(100, 8, 100, 8),
//                    color: Colors.black12,
//                    textColor: Colors.black,
                  ),
                ]
                ),
//                Container(
//                  height: 30.0,
//                  child: CirclePageIndicator(
//                    itemCount: 6,
//                    currentPageNotifier: _currentPageNotifier,
//                  ),
//                ),
          )
          );
  }
  _moveToCreateView(BuildContext context, TodoBloc bloc) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TodoNewView(todoBloc: bloc, todo: Todo.newTodo()))
  );
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
                      height: 300,
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
                      height: 150,
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
                      height: 150,
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
                      height: 150,
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
                      height: 150,
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