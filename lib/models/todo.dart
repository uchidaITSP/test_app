import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Todo {
  String id;
  String name;
  String kana;
  String password;
  String passwordcheck;
  String birthday;
  DateTime dueDate;
  String phonenumber;
  String post;
  String prefecture;
  String city;
  String town;

  Todo({this.id,@required this.name, @required this.kana, @required this.password, @required this.passwordcheck, @required this.birthday, @required this.dueDate, @required this.phonenumber,
                                                                    @required this.post, @required this.prefecture, @required this.city,@required this.town,});
  Todo.newTodo() {
    name = "";
    kana = "";
    password = "";
    passwordcheck = "";
    birthday = "";
    dueDate = DateTime.now();
    phonenumber = "";
    post = "";
    prefecture = "";
    city = "";
    town = "";
  }

  assignUUID() {
    id = Uuid().v4();
  }

  // staticでも同じ？
  factory Todo.fromMap(Map<String, dynamic> json) => Todo(
      id: json["id"],
      name: json["name"],
      kana: json["kana"],
      password: json["password"],
      passwordcheck: json["passwordcheck"],
      birthday: json["birthday"],
      // DateTime型は文字列で保存されているため、DateTime型に変換し直す
      dueDate: DateTime.parse(json["dueDate"]).toLocal(),
      phonenumber: json["phonenumber"],
      post: json["post"],
    prefecture: json["prefecture"],
      city: json["city"],
      town: json["town"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "kana": kana,
    "password": password,
    "passwordcheck": passwordcheck,
    "birthday": birthday,
    // sqliteではDate型は直接保存できないため、文字列形式で保存する
    "dueDate": dueDate.toUtc().toIso8601String(),
    "phonenumber": phonenumber,
    "post": post,
    "prefecture": prefecture,
    "city": city,
    "town": town,
  };
}