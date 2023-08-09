import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task_manager/Data/Models/auth_Utils.dart';
import 'package:task_manager/Data/Models/network_responce.dart';
import 'package:task_manager/UI/Screens/auth/LogIn_Screen.dart';
import 'package:task_manager/app.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      }else if (response.statusCode == 401) {
          gotoLogin();
      }
      else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  Future<NetworkResponse> postRequest(
      String url, Map<String, dynamic>? body ,{bool isLogin = false}) async {
    try {
      Response response = await post(Uri.parse(url),
          headers:
          {"Content-Type": "application/json",
            'token': AuthActivity.useInfo.token.toString()}
          ,
          body: jsonEncode(body));
      log(response.statusCode.toString());
      log(response.body.toString());

      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      }else if (response.statusCode == 401) {
        if (isLogin == false) {
          gotoLogin();
        }
      }
      else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  Future<void> gotoLogin() async {
    await AuthActivity.clearUserInfo();
    Navigator.pushAndRemoveUntil(
        TaskApp.globalKey.currentContext!,
        MaterialPageRoute(builder: (context) => const LogInScreen()),
            (route) => false);
  }
}
