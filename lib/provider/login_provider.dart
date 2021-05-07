import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
//  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
//  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldkey;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  bool _isEmailActive = false;
  bool get isEmailActive => _isEmailActive;

  bool get isBtnActive => isEmailActive && isPasswordActive;
  void onEmailChange(val) {
    print('Email: $val');
    _isEmailActive = true;
    notifyListeners();
  }

  bool _obsecureText = true;
  bool get obsecureText => _obsecureText;
  void togglePassword() {
    _obsecureText = !_obsecureText;
    notifyListeners();
  }

  bool _checkVal = false;
  bool get checkVal => _checkVal;
  void toggleCheck() {
    _checkVal = !_checkVal;
    notifyListeners();
  }

  bool _isPasswordActive = false;
  bool get isPasswordActive => _isPasswordActive;

  void onPasswordChange(val) {
    print('Password: $val');
    _isPasswordActive = true;
    notifyListeners();
  }
}
