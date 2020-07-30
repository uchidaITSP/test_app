import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_app/configs/const_text.dart';
import 'package:test_app/models/todo.dart';
import 'package:test_app/data/CtrQuery/todo_bloc.dart';

class TodoEditView extends StatelessWidget {

  final DateFormat _format = DateFormat("yyyy-MM-dd HH:mm");

  final TodoBloc todoBloc;
  final Todo todo;
  final Todo _newTodo = Todo.newTodo();

  TodoEditView({Key key, @required this.todoBloc, @required this.todo}){
    // Dartでは参照渡しが行われるため、todoをそのまま編集してしまうと、
    // 更新せずにリスト画面に戻ったときも値が更新されてしまうため、
    // 新しいインスタンスを作る
    _newTodo.id = todo.id;
    _newTodo.name = todo.name;
    _newTodo.kana = todo.kana;
    _newTodo.password = todo.password;
    _newTodo.birthday = todo.birthday;
    _newTodo.dueDate = todo.dueDate;
    _newTodo.phonenumber = todo.phonenumber;
    _newTodo.post = todo.post;
    _newTodo.prefecture = todo.prefecture;
    _newTodo.city = todo.city;
    _newTodo.town = todo.town;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('アカウント設定')),
        body: Container(
          padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _top(),

                  _nameTextFormField(),
                  _kanaTextFormField(),
//                _PasswordTextFormField(),
                _birthdayTextFormField(),
                _dueDateTimeFormField(),
                _phonenumberTextFormField(),
                _postTextFormField(),
                _prefectureTextFormField(),
                _cityTextFormField(),
                _townTextFormField(),
                _confirmButton(context)
              ],
            ),
          )
        )
    );
  }

  Widget _top() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(  // 3.1.1行目
            child: Text(
              "基本情報",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
          Container(  // 3.1.2行目
            child: Text(
              "処方せん、薬等の配送先となるので、住所は正確にご入力ください",
              style: TextStyle(fontSize: 12.0, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget _nameTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "名前"),
    initialValue: _newTodo.name,
    onChanged: _setName,
  );

  void _setName(String name) {
    _newTodo.name = name;
  }

  Widget _kanaTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "名前(カタカナ)"),
    initialValue: _newTodo.kana,
    onChanged: _setKana,
  );

  void _setKana(String kana) {
    _newTodo.kana = kana;
  }

  Widget _PasswordTextFormField() => TextFormField(
//    decoration: InputDecoration(labelText: "パスワード"),
    decoration: new InputDecoration(
      border: const UnderlineInputBorder(),
      labelText: 'パスワード',
    ),
    obscureText: true,
    initialValue: _newTodo.password,
    onChanged: _setPassword,
  );

  void _setPassword(String password) {
    _newTodo.password = password;
  }

  Widget _birthdayTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "生年月日"),
    keyboardType: TextInputType.number,
    initialValue: _newTodo.birthday,
    onChanged: _setBirthday,
  );

  void _setBirthday(String birthday) {
    _newTodo.birthday = birthday;
  }

  // ↓ https://pub.dev/packages/datetime_picker_formfield のサンプルから引用
  Widget _dueDateTimeFormField() => DateTimeField(
      format: _format,
      decoration: InputDecoration(labelText: "締切日"),
      initialValue: _newTodo.dueDate ?? DateTime.now(),
      onChanged: _setDueDate,
      onShowPicker: (context, currentValue) async {
        final date = await showDatePicker(
            context: context,
            firstDate: DateTime(2000),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
        if (date != null) {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(
                currentValue ?? DateTime.now()),
          );
          return DateTimeField.combine(date, time);
        } else {
          return currentValue;
        }
      }
  );

  void _setDueDate(DateTime dt) {
    _newTodo.dueDate = dt;
  }

  Widget _phonenumberTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "電話番号"),
    keyboardType: TextInputType.number,
    initialValue: _newTodo.phonenumber,
    onChanged: _setPhonenumber,
  );

  void _setPhonenumber(String phonenumber) {
    _newTodo.phonenumber = phonenumber;
  }

  Widget _postTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "郵便番号"),
    keyboardType: TextInputType.number,
    initialValue: _newTodo.post,
    onChanged: _setPost,
  );

  void _setPost(String post) {
    _newTodo.post = post;
  }

  Widget _prefectureTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "都道府県"),
    initialValue: _newTodo.prefecture,
    onChanged: _setPrefecture,
  );

  void _setPrefecture(String prefecture) {
    _newTodo.prefecture = prefecture;
  }

  Widget _cityTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "市区町村"),
    initialValue: _newTodo.city,
    onChanged: _setCity,
  );

  void _setCity(String city) {
    _newTodo.city = city;
  }

  Widget _townTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "町名・番地・建物名"),
    initialValue: _newTodo.town,
    onChanged: _setTown,
  );

  void _setTown(String town) {
    _newTodo.town = town;
  }

  Widget _confirmButton(BuildContext context) => FlatButton(
    child: Text('基本情報を更新する'),
    onPressed: () {
      if (_newTodo.id == null) {
        todoBloc.create(_newTodo);
      } else {
        todoBloc.update(_newTodo);
      }

      Navigator.of(context).pop();
    },


    padding: EdgeInsets.fromLTRB(50, 8, 50, 8),
    color: Colors.red,
    textColor: Colors.white,
  );
}