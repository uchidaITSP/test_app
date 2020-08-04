import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class User {
  String id;
  String username;
  String kana;
  String birthday;
  String gender;
  String mail_address;
  String phone_number;
  String post_number;
  String prefectures;
  String address;
  String building_name;
  String password;
  String insurance_card_info;
  DateTime updated_at;

  User({@required this.id, @required this.username, @required this.kana, @required this.birthday, @required this.gender, @required this.mail_address, @required this.phone_number,
    @required this.post_number, @required this.prefectures, @required this.address, @required this.building_name, @required this.password,
    @required this.insurance_card_info, @required this.updated_at,});

  User.newUser() {
    id = "";
    username = "";
    kana = "";
    birthday = "";
    gender = "";
    mail_address = "";
    phone_number = "";
    post_number = "";
    prefectures = "";
    address = "";
    building_name = "";
    password = "";
    insurance_card_info = "";
    updated_at = DateTime.now();
  }

//  assignUUID() {
//    id = Uuid().v4();
//  }

  factory User.fromMap(Map<String, dynamic> json) => User(
    id: json['id'],
    username : json['username'],
    kana: json['kana'],
    birthday: json['birthday'],
    gender: json["gender"],
    mail_address: json["mail_address"],
    phone_number: json["phone_number"],
    post_number: json["post_number"],
    prefectures: json["prefectures"],
    address: json["address"],
    building_name: json["building_name"],
    password: json["password"],
    insurance_card_info: json["kana"],
//    updated_at: DateTime.parse(json["updated_at"]).toLocal(),
//    updated_at: DateTime.parse(json["updated_at"]).toLocal(),
  );

//  String get username => username;
////  String get password => password;

  Map<String, dynamic> toMap() => {
    "id" : id,
    "username" : username,
    "kana" : kana,
    "birthday" : birthday,
    "gender" : gender,
    "mail_address" : mail_address,
    "phone_number" : phone_number,
    "post_number" : post_number,
    "prefectures" : prefectures,
    "address" : address,
    "building_name" : building_name,
    "password" : password,
    "insurance_card_info" : insurance_card_info,
//    "updated_at" : updated_at.toUtc().toIso8601String(),
//    "updated_at": updated_at.toUtc().toIso8601String(),
  };
}