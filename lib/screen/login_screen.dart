import 'package:flutter/material.dart';
import 'package:test_app/main.dart';
import 'package:test_app/models/user.dart';
import 'package:test_app/services/response/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
//  createStateでStateを作成
  _LoginPageState createState() => new _LoginPageState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginPageState extends State<LoginPage> implements LoginCallBack {
//  ログイン状態を入れるStatusに未ログイン状態をセット
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String _username, _password;

  LoginResponse _response;

  _LoginPageState() {
    _response = new LoginResponse(this);
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        _response.doLogin(_username, _password);
      });
    }
  }


  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  var value;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");

      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.commit();
//      ログイン状態に未ログイン状態をセットする
      _loginStatus = LoginStatus.notSignIn;
    });
  }

  @override
  void initState() {
//    Stateの初期化
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
//    ここで分岐?既にログイン状態なら次のページを出すようにする
//    未ログイン状態ならログインページを出す
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        _ctx = context;
        final _passwordFocusNode = FocusNode();

//        ログインボタンの設定
        var loginBtn = new ButtonTheme(
          minWidth: 300.0,
          height: 50.0,
          child: RaisedButton(
           onPressed: _submit,
           child: new Text("ログイン", style: TextStyle(
            color: Colors.white70,
            fontSize: 18.0,
            ),
           ),
          color: Colors.red,
          ),
        );
//        ログインページの中身の設定
        var loginForm = new Column(
//          横の位置の設定
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Form(
              key: formKey,
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new TextFormField(
                      onSaved: (val) => _username = val,
                      decoration: new InputDecoration(labelText: "お名前"/*電話番号 または メールアドレス*/),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
                      },
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new TextFormField(
                      onSaved: (val) => _password = val,
                      decoration: new InputDecoration(labelText: "パスワード"),
                      obscureText: true,
                      focusNode: _passwordFocusNode,
                    ),
                  )
                ],
              ),
            ),
            loginBtn,
          ],
        );

//        表示するもの(画面の構成的な)
        return new Scaffold(
          appBar: new AppBar(
            title: Center(
                child: new Text("ログイン"),
            ),
          ),
          key: scaffoldKey,
          body: new Container(
            child: new Center(
              child: loginForm,
            ),
          ),
        );
        break;

//        ログインしてる時の処理
      case LoginStatus.signIn:

//        変更コード
        return MyApp();
//        元コード
//        return HomeScreen(signOut);
        break;
    }
  }

//  ログイン成功時に値を入れる
  savePref(int value,String user, String pass) async {
//    SharedPreferences でアプリのほうにデータを残す→再起動してもそのまま
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("user", user);
      preferences.setString("pass", pass);
      preferences.commit();
    });
  }

  @override
  void onLoginError(String error) {
    _showSnackBar(error);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(User user) async {

//    userに何か入っている→ログインに成功
    if(user != null){
      savePref(1,user.username, user.password);
      _loginStatus = LoginStatus.signIn;
//      userに何も入っていない→ログインに失敗
    }else{
      _showSnackBar("ログインに失敗しました。\n正しいログイン情報を入力してください");
      setState(() {
        _isLoading = false;
      });
    }
  }
}