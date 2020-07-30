import 'package:flutter/material.dart';
import 'package:test_app/models/todo.dart';
import 'package:test_app/view/todo_new/todo_new_view.dart';
import 'package:test_app/view/todo_edit/todo_edit_view.dart';
import 'package:test_app/data/CtrQuery/todo_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/models/user.dart';
import '../main.dart';


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
          ),
      ),
      body: Container(

        child: Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            _Acounttop(),
            Provider<TodoBloc>(
              create: (context) => new TodoBloc(),
              dispose: (context, bloc) => bloc.dispose(),
             child: _Acountmain(),
            )
          ],
        ),
      )// <- (※3)
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
                  child: Text("粟谷陸"),
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
    final _bloc = Provider.of<TodoBloc>(context, listen: false);


     return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text('アカウント設定'),
          ),
          Container(
            child: StreamBuilder<List<Todo>> (
                stream: _bloc.todoStream,
                // ignore: missing_return
                builder: (context, AsyncSnapshot<List<Todo>> snapshot) {
                  if(snapshot.hasData) {
//                 ListView.builderでfor文のような繰り返し処理
                    return ListView.builder(

//                  child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
//                        下のcontainerで回しているitemをどれくらい繰り返すか
                        itemCount: 1,
//                      // ignore: missing_return
                        itemBuilder: (BuildContext context, int index) {
//                        Todoの情報を取得している
//                      　 indexでデータベースのどこを処理したいかを設定(ここにログインした人の情報を入れる)
                        Todo todo = snapshot.data[1];

                      return Column(
                            children:
                            ListTile.divideTiles(
                              context: context,
                              tiles: [
                                ListTile(
                                  key: Key(todo.id),
                                  title: Text('基本情報'),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                  onTap: () {
                                    _moveToEditView(
                                        context, _bloc, todo);
                                  },
                                ),
                                ListTile(
                                  title: Text('会員登録'),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                  onTap: () {
                                    _moveToCreateView(context, _bloc);
                                  },
                                ),
                                 ListTile(
                    title: Text('ログアウト'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () async {
//                      アプリ内に保存されたデータを削除
                      SharedPreferences preferences = await SharedPreferences.getInstance();
                      preferences.remove("value");
                      // 画面をすべて除いてログイン画面を表示
                      Navigator.pushAndRemoveUntil(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Login()),
                              (_) => false);
                    },
                  ),
                ],
              ).toList(),
                          );
                        }
                      );
                    }
                  return Center(child: CircularProgressIndicator());
                 }
              ),
          )
        ]
      )
    );
  }

  _moveToEditView(BuildContext context, TodoBloc bloc, Todo todo) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TodoEditView(todoBloc: bloc, todo: todo))
  );

  _moveToCreateView(BuildContext context, TodoBloc bloc) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TodoNewView(todoBloc: bloc, todo: Todo.newTodo()))
  );

}

//scrollDirection: Axis.vertical,
//shrinkWrap: true,

//             StreamBuilder<List<Todo>>(
//                stream: _bloc.todoStream,
//                builder: (context, AsyncSnapshot<List<Todo>> snapshot) {
//                  var listItem = ['基本情報','会員登録','ログアウト'];
////                  AsyncSnapshot<List<Todo>> todo = snapshot;
//                  return ListView.builder(
////                  child: ListView(
//                      scrollDirection: Axis.vertical,
//                      shrinkWrap: true,
//
//                      itemCount: listItem.length,
//                      // ignore: missing_return
//                      itemBuilder: (BuildContext context, int index) {
////                        Todo todo = snapshot.data[index];
//
//                        return Container(
//                          child: ListTile(
//                            title: Text(&listItem),
//                          ),
//                        );
//
//                      }
//                  );
//                }