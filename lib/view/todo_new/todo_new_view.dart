import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_app/configs/const_text.dart';
import 'package:test_app/main.dart';
import 'package:test_app/models/todo.dart';
import 'package:test_app/data/CtrQuery/todo_bloc.dart';
import 'package:test_app/view/Top.dart';

class TodoNewView extends StatelessWidget {

  final DateFormat _format = DateFormat("yyyy-MM-dd HH:mm");

  final TodoBloc todoBloc;
  final Todo todo;
  final Todo _newTodo = Todo.newTodo();
  final _formKey = GlobalKey<FormState>();


  TodoNewView({Key key, @required this.todoBloc, @required this.todo}){
    // Dartでは参照渡しが行われるため、todoをそのまま編集してしまうと、
    // 更新せずにリスト画面に戻ったときも値が更新されてしまうため、
    // 新しいインスタンスを作る
    _newTodo.id = todo.id;
    _newTodo.name = todo.name;
    _newTodo.kana = todo.kana;
    _newTodo.password = todo.password;
    _newTodo.passwordcheck = todo.passwordcheck;
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
        appBar: AppBar(title: Text('アカウント作成')),
        body: Container(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                  _form(context),
////                _nameTextFormField(),
////                _kanaTextFormField(),
////                _birthdayTextFormField(),
////                _phonenumberTextFormField(),
////                _PasswordTextFormField(),
////                _PasswordCheckTextFormField(),
////                _confirmButton(context)
              ]
            )
          )
        )
    );
  }

  Widget _form(BuildContext context){
      return Form(
//        key: _formKey,
        child: Column(
              children: <Widget>[
                _nameTextFormField(),
                _kanaTextFormField(),
                _birthdayTextFormField(),
                _phonenumberTextFormField(),
                _PasswordTextFormField(),
                _PasswordCheckTextFormField(),
                _confirmButton(context),
                _logintransition(context),
              ],
        ),
      );
  }

  Widget _nameTextFormField() {
    return Form(
//        key: _formKey,
        child: Column(
            children: <Widget>[
            TextFormField(
//              validator: (value) {
//                if (value.isEmpty) {
//                  return '名前を入力してください';
//                }
//                return "";
//              },
          decoration: InputDecoration(labelText: "名前", hintText: "鈴木太郎"),
          initialValue: _newTodo.name,
          onChanged: _setName,
        )
            ]
        )
    );
  }
  void _setName(String name) {
    _newTodo.name = name;
  }

  Widget _kanaTextFormField(){
    return Form(
//      key: _formKey,
      child: Column(
        children: <Widget>[
        TextFormField(
//          validator: (value) {
//            if (value.isEmpty) {
//              return '名前(カタカナ)を入力してください';
//            }
//            return "";
//          },
          decoration: InputDecoration(labelText: "名前(カタカナ)",hintText: "スズキタロウ"),
          initialValue: _newTodo.kana,
          onChanged: _setKana,
        )
        ],
      ),
    );
  }
//  Widget _kanaTextFormField() => TextFormField(
//    decoration: InputDecoration(labelText: "名前(カタカナ)",hintText: "スズキタロウ"),
//    initialValue: _newTodo.kana,
//    onChanged: _setKana,
//  );

  void _setKana(String kana) {
    _newTodo.kana = kana;
  }

  Widget _PasswordTextFormField() => TextFormField(
    decoration: new InputDecoration(
      border: const UnderlineInputBorder(),
      labelText: 'パスワード',
      hintText: "パスワードを8文字以上入力してください"
    ),
    obscureText: true,
    initialValue: _newTodo.password,
    onChanged: _setPassword,
  );

  void _setPassword(String password) {
    _newTodo.password = password;
  }

  Widget _PasswordCheckTextFormField() => TextFormField(
    decoration: new InputDecoration(
      border: const UnderlineInputBorder(),
      labelText: 'パスワード確認',
      hintText: "パスワードと同じ文字を入力してください"
    ),
    obscureText: true,
    initialValue: _newTodo.passwordcheck,
    onChanged: _setPasswordcheck,
  );

  void _setPasswordcheck(String passwordcheck) {
    _newTodo.passwordcheck = passwordcheck;
  }

  Widget _birthdayTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "生年月日",hintText: "1980-01-01"),
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
    decoration: InputDecoration(labelText: "電話番号",hintText: "0312345678"),
    keyboardType: TextInputType.number,
    initialValue: _newTodo.phonenumber,
    onChanged: _setPhonenumber,
  );

  void _setPhonenumber(String phonenumber) {
    _newTodo.phonenumber = phonenumber;
  }

  Widget _confirmButton(BuildContext context) => FlatButton(
    child: Text('アカウント登録'),
    onPressed: () {

//      if (_formKey.currentState.validate()) {
        // バリデーションが通ればスナックバーを表示

        if (_newTodo.id == null) {
          todoBloc.create(_newTodo);

        } else {
          todoBloc.update(_newTodo);
        }
        Navigator.of(context).pop();
//      }
    },


    padding: EdgeInsets.fromLTRB(50, 8, 50, 8),
    color: Colors.red,
    textColor: Colors.white,
  );

  Widget _logintransition(BuildContext context) => FlatButton(
        child: Text("アカウントをお持ちの方"),
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => Top()
              )
          );
        },

        color: Colors.white,
        textColor: Colors.red,
    );
}