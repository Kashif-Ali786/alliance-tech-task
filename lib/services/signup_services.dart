import 'dart:convert';

import 'package:flutter_a/pages/login_page.dart';
import 'package:flutter_a/provider/register_provider.dart';
import 'package:flutter_a/services/login_services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpServices {
  static final String _signUp = '/api/auth/register';

  Future signUpUser({
    RegisterProvider provider,
  }) async {
    try {
      provider.setLoader(true);
      var _email = provider.emailCont.text;
      print("saved Email====$_email");

      var responce = await http.post(
        '$baseeURl$_signUp',
        body: {
          'email': '${provider.emailCont.text}',
          'name': '${provider.nameCont.text}',
          'password': '${provider.passwordCont.text}',
          'confirm': '${provider.confirmpasswordCont.text}',
          'company_name': '${provider.companyName4.text}',
          'company_no': '${provider.companyNo.text}',
          'username': '${provider.usernameCont.text}',
        },
      );
      var data = jsonDecode(responce.body);
      print('sign up responce === $data');
//      if (responce.statusCode != null) {
//        provider.setLoader(false);
//        Get.back();
//      }

      if (responce.statusCode == 200) {
        Get.off(() => LoginPage());

        provider.emailCont.clear();
        provider.passwordCont.clear();
        provider.nameCont.clear();
//
//        if (data["code"] == 200) {
//          var id = data["data"]["id"];
//          setIsLoggedIn(provider.checkVal);
//          Get.rawSnackbar(
//            duration: Duration(seconds: 3),
//            message: '${data["message"]}',
//          );
//          Future.delayed(Duration(seconds: 3), () {
//            Get.off(LoginPage());
//
//            provider.emailCont.clear();
//            provider.passwordCont.clear();
//            provider.nameCont.clear();
//          });
//        }
//        if (data["code"] != 200) {
//          Get.rawSnackbar(
//            message: '${data["error"][0]}',
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

      print('exception');
      print('${e.toString()}');
    }
  }
}
