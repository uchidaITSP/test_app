import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_app/configs/const_text.dart';
import 'package:test_app/models/user.dart';
import 'package:test_app/data/CtrQuery/user_bloc.dart';

class UserEditView extends StatelessWidget {

  final DateFormat _format = DateFormat("yyyy-MM-dd HH:mm");

  final UserBloc userBloc;
  final User user;
  final User _newUser = User.newUser();

  UserEditView({Key key, @required this.userBloc, @required this.user}){
    // Dartでは参照渡しが行われるため、userをそのまま編集してしまうと、
    // 更新せずにリスト画面に戻ったときも値が更新されてしまうため、
    // 新しいインスタンスを作る
    _newUser.id = user.id;
    _newUser.username = user.username;
    _newUser.kana = user.kana;
    _newUser.password = user.password;
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
                _phone_numberTextFormField(),
                _post_numberTextFormField(),
                _prefecturesTextFormField(),
                _addressTextFormField(),
                _building_nameTextFormField(),
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
    initialValue: _newUser.username,
    onChanged: _setName,
  );

  void _setName(String name) {
    _newUser.username = name;
  }

  Widget _kanaTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "名前(カタカナ)"),
    initialValue: _newUser.kana,
    onChanged: _setKana,
  );

  void _setKana(String kana) {
    _newUser.kana = kana;
  }

  Widget _PasswordTextFormField() => TextFormField(
//    decoration: InputDecoration(labelText: "パスワード"),
    decoration: new InputDecoration(
      border: const UnderlineInputBorder(),
      labelText: 'パスワード',
    ),
    obscureText: true,
    initialValue: _newUser.password,
    onChanged: _setPassword,
  );

  void _setPassword(String password) {
    _newUser.password = password;
  }

  Widget _birthdayTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "生年月日"),
    keyboardType: TextInputType.number,
    initialValue: _newUser.birthday,
    onChanged: _setBirthday,
  );

  void _setBirthday(String birthday) {
    _newUser.birthday = birthday;
  }

  // ↓ https://pub.dev/packages/datetime_picker_formfield のサンプルから引用
  Widget _dueDateTimeFormField() => DateTimeField(
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
    decoration: InputDecoration(labelText: "電話番号"),
    keyboardType: TextInputType.number,
    initialValue: _newUser.phone_number,
    onChanged: _setPhonenumber,
  );

  void _setPhonenumber(String phone_number) {
    _newUser.phone_number = phone_number;
  }

  Widget _post_numberTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "郵便番号"),
    keyboardType: TextInputType.number,
    initialValue: _newUser.post_number,
    onChanged: _setPost,
  );

  void _setPost(String post_number) {
    _newUser.post_number = post_number;
  }

  Widget _prefecturesTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "都道府県"),
    initialValue: _newUser.prefectures,
    onChanged: _setPrefecture,
  );

  void _setPrefecture(String prefectures) {
    _newUser.prefectures = prefectures;
  }

  Widget _addressTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "市区町村"),
    initialValue: _newUser.address,
    onChanged: _setCity,
  );

  void _setCity(String address) {
    _newUser.address = address;
  }

  Widget _building_nameTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "町名・番地・建物名"),
    initialValue: _newUser.building_name,
    onChanged: _setTown,
  );

  void _setTown(String building_name) {
    _newUser.building_name = building_name;
  }

  Widget _confirmButton(BuildContext context) => FlatButton(
    child: Text('基本情報を更新する'),
    onPressed: () {
      if (_newUser.id == null) {
        userBloc.create(_newUser);
      } else {
        userBloc.update(_newUser);
      }

      Navigator.of(context).pop();
    },

    padding: EdgeInsets.fromLTRB(50, 8, 50, 8),
    color: Colors.red,
    textColor: Colors.white,
  );
}