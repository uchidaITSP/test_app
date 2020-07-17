import 'package:flutter/material.dart';

class Acount extends StatelessWidget { // <- (※1)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('アカウント'),
              )
            ],
          )
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _Acounttop(),
            _Acountmain(),
          ],
        ),
      ) // <- (※3)
    );
  }
}
class _Acounttop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.black12,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.account_circle,size: 60,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 50, 0, 5),
                  child: Text('粟谷陸'),
                ),
                Flexible(
                  child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text('メールアドレス登録'),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ]
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Acountmain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text('アカウント設定'),
          ),
          Container(
            child:ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,

              children: ListTile.divideTiles(
                context: context,
                tiles: [
                  ListTile(
                    title: Text('基本情報'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: (){

                    },
                  ),
                  ListTile(
                    title: Text('会員登録'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: (){

                    },
                  ),
                  ListTile(
                    title: Text('ログイン'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: (){

                    },
                  ),
                  ListTile(
                    title: Text('ログアウト'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: (){

                    },
                  ),
                ],
              ).toList(),

//              children: <Widget>[
//
//                ListTile(
//                  title: Text("基本情報"),
//                  trailing: Icon(Icons.arrow_forward_ios),
//                ),
//
//                ListTile(
//                  title: Text("ログイン"),
//                  trailing: Icon(Icons.arrow_forward_ios),
//                ),
//                ListTile(
//                  title: Text("ログアウト"),
//                  trailing: Icon(Icons.arrow_forward_ios),
//                ),
//              ],
            ),
          )
        ],
      )
    );
  }
}

//scrollDirection: Axis.vertical,
//shrinkWrap: true,