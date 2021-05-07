import 'dart:convert';

import 'package:flutter_a/pages/profile_page.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/login_provider.dart';

String baseeURl = "https://showitwithmackie.com/spotat/public";
String IS_LOGGED_IN = 'random loginIn flag';
String ACCESS_TOKEN = 'random loginIn flag';

class LoginService {
  static Future<dynamic> loginUser({LoginProvider provider}) async {
    try {
      var responce = await http.post(
        '$baseeURl/api/auth/login',
        body: {
          'email': '${provider.emailController.text}',
          'password': '${provider.passwordController.text}',
        },
      );
      var data = jsonDecode(responce.body);
//      print("1 : ${data["data"]["access_token"]}");
//      print("2 : ${jsonEncode(data["data"]["access_token"])}");
//      print("2 : ${jsonDecode(responce.body)["data"]["access_token"]}");
//      print('signIn responce === $data');
      if (responce.statusCode != null) {
        Get.back();
      }
      if (responce.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('option', true);
        await prefs.setString('token', data["data"]["access_token"] ?? "");
        Get.offAll(() => HomePage());

//        setAccessToken(jsonEncode(data["access_token"]));
//        if (data["code"] == 200 && data["result"] != null) {
//        } else {
//          Get.rawSnackbar(
//            duration: Duration(seconds: 5),
//            message: data["message"],
//          );
//        }
      } else {
        Get.back();
        Get.rawSnackbar(
          message: data["message"][0].toString(),
        );
      }
    } catch (e) {
      Get.back();
      Get.rawSnackbar(
        duration: Duration(seconds: 5),
        message: e.toString(),
      );

      print("login exception");
      print(e.toString());
    }
  }
}

Future<bool> setIsLoggedIn(bool value) async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  return await prefs.setBool(IS_LOGGED_IN, value);
}

Future<bool> getIsLoggedIn() async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  return prefs.getBool(IS_LOGGED_IN ?? false) ?? false;
}

Future<bool> setAccessToken(String value) async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;

  return prefs.setString(ACCESS_TOKEN, value);
}

Future<String> getAccessToken() async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  return prefs.getString(ACCESS_TOKEN) ?? 'no token';
}
