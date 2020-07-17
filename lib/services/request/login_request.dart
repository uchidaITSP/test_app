import 'dart:async';

import 'package:test_app/models/user.dart';
import 'package:test_app/data/CtrQuery/login_ctr.dart';

class LoginRequest {
  LoginCtr con = new LoginCtr();

  Future<User> getLogin(String username, String password) {
    var result = con.getLogin(username,password);
    return result;
  }
}