import 'dart:async';
import 'dart:core';
import 'package:test_app/models/user.dart';

import 'package:test_app/data/database_helper.dart';
import 'package:test_app/models/user.dart';
/**/
class UserBloc {

  final _userController = StreamController<List<User>>();
  Stream<List<User>> get userStream => _userController.stream;

  getUsers() async {
    _userController.sink.add(await DatabaseHelper.db.getAllUsers());
  }

  UserBloc() {
    getUsers();
  }

  dispose() {
    _userController.close();
  }

  create(User user) {
    // ignore: unnecessary_statements
    user.id;
    DatabaseHelper.db.createUser(user);
    getUsers();
  }

  update(User user) {
    DatabaseHelper.db.updateUser(user);
    getUsers();
  }

  delete(String id) {
    DatabaseHelper.db.deleteUser(id);
    getUsers();
  }
}