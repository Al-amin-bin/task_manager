import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/Data/Models/login_Model.dart';

class AuthActivity {
  AuthActivity._();
  static LoginModel useInfo = LoginModel();

  static Future<void> saveUserInfo(LoginModel model) async {
    SharedPreferences _sharerdPrefs = await SharedPreferences.getInstance();
    await _sharerdPrefs.setString("user-info", model.toJson().toString());
    useInfo = model;
  }

  static Future<LoginModel> getUserInfo() async {
    SharedPreferences _sharerdPrefs = await SharedPreferences.getInstance();
    String value = _sharerdPrefs.getString("user_info")!;
    return LoginModel.fromJson(jsonDecode(value));
  }

  static Future<void> clearUserInfo() async {
    SharedPreferences _sharerdPrefs = await SharedPreferences.getInstance();
    _sharerdPrefs.clear();
  }

  static Future<bool> checkUserInfoLogin() async {
    SharedPreferences _sharerdPrefs = await SharedPreferences.getInstance();
    bool isLogin =  _sharerdPrefs.containsKey("user_info");
    if(isLogin){
      useInfo = await getUserInfo();
    }
    return isLogin;
  }
}
