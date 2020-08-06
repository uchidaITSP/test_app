import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_app/configs/const_text.dart';
import 'package:test_app/main.dart';
import 'package:test_app/models/user.dart';
import 'package:test_app/data/CtrQuery/user_bloc.dart';
import 'package:test_app/view/Top.dart';

class UserNewView extends StatelessWidget {

  final DateFormat _format = DateFormat("yyyy-MM-dd HH:mm");

  final UserBloc userBloc;
  final User user;
  final User _newUser = User.newUser();
  final _formKey = GlobalKey<FormState>();


  UserNewView({Key key, @required this.userBloc, @required this.user}){
    // Dartでは参照渡しが行われるため、userをそのまま編集してしまうと、
    // 更新せずにリスト画面に戻ったときも値が更新されてしまうため、
    // 新しいインスタンスを作る
    _newUser.id = user.id;
    _newUser.username = user.username;
    _newUser.kana = user.kana;
    _newUser.password = user.password;
//    _newUser.passwordcheck = user.passwordcheck;
    _newUser.birthday = user.birthday;
    _newUser.updated_at = user.updated_at;
    _newUser.phone_number = user.phone_number;
    _newUser.post_number = user.post_number;
    _newUser.prefectures = user.prefectures;
    _newUser.address = user.address;
    _newUser.building_name = user.building_name;
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
////                _usernameTextFormField(),
////                _kanaTextFormField(),
////                _birthdayTextFormField(),
////                _phone_numberTextFormField(),
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
                _usernameTextFormField(),
                _kanaTextFormField(),
                _birthdayTextFormField(),
                _phone_numberTextFormField(),
                _PasswordTextFormField(),
//                _PasswordCheckTextFormField(),
                _confirmButton(context),
                _logintransition(context),
              ],
        ),
      );
  }

  Widget _usernameTextFormField() {
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
          initialValue: _newUser.username,
          onChanged: _setName,
        )
            ]
        )
    );
  }
  void _setName(String username) {
    _newUser.username = username;
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
          initialValue: _newUser.kana,
          onChanged: _setKana,
        )
        ],
      ),
    );
  }
//  Widget _kanaTextFormField() => TextFormField(
//    decoration: InputDecoration(labelText: "名前(カタカナ)",hintText: "スズキタロウ"),
//    initialValue: _newUser.kana,
//    onChanged: _setKana,
//  );

  void _setKana(String kana) {
    _newUser.kana = kana;
  }

  Widget _PasswordTextFormField() => TextFormField(
    decoration: new InputDecoration(
      border: const UnderlineInputBorder(),
      labelText: 'パスワード',
      hintText: "パスワードを8文字以上入力してください"
    ),
    obscureText: true,
    initialValue: _newUser.password,
    onChanged: _setPassword,
  );

  void _setPassword(String password) {
    _newUser.password = password;
  }

//  Widget _PasswordCheckTextFormField() => TextFormField(
//    decoration: new InputDecoration(
//      border: const UnderlineInputBorder(),
//      labelText: 'パスワード確認',
//      hintText: "パスワードと同じ文字を入力してください"
//    ),
//    obscureText: true,
//    initialValue: _newUser.passwordcheck,
//    onChanged: _setPasswordcheck,
//  );
//
//  void _setPasswordcheck(String passwordcheck) {
//    _newUser.passwordcheck = passwordcheck;
//  }

  Widget _birthdayTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "生年月日",hintText: "1980-01-01"),
    keyboardType: TextInputType.number,
    initialValue: _newUser.birthday,
    onChanged: _setBirthday,
  );

  void _setBirthday(String birthday) {
    _newUser.birthday = birthday;
  }

  // ↓ https://pub.dev/packages/datetime_picker_formfield のサンプルから引用
  Widget _updated_atTimeFormField() => DateTimeField(
      format: _format,
      decoration: InputDecoration(labelText: "締切日"),
      initialValue: _newUser.updated_at ?? DateTime.now(),
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
    _newUser.updated_at = dt;
  }

  Widget _phone_numberTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "電話番号",hintText: "080-4321-9876"),
    keyboardType: TextInputType.number,
    initialValue: _newUser.phone_number,
    onChanged: _setPhonenumber,
  );

  void _setPhonenumber(String phone_number) {
    _newUser.phone_number = phone_number;
  }

  Widget _confirmButton(BuildContext context) => FlatButton(
    child: Text('アカウント登録'),
    onPressed: () {

//      if (_formKey.currentState.validate()) {
        // バリデーションが通ればスナックバーを表示

        if (_newUser.id == null) {
          userBloc.create(_newUser);

        } else {
          userBloc.update(_newUser);
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