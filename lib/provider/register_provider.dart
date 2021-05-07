import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
//  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _uname = TextEditingController();
  TextEditingController _companyName = TextEditingController();
  TextEditingController _companyNo = TextEditingController();
  TextEditingController get emailCont => _emailController;
  TextEditingController get passwordCont => _passwordController;
  TextEditingController get confirmpasswordCont => _confirmpasswordController;
  TextEditingController get nameCont => _name;
  TextEditingController get usernameCont => _uname;
  TextEditingController get companyName4 => _companyName;
  TextEditingController get companyNo => _companyNo;

  bool _isEmailActive = false;
  bool get isEmailActive => _isEmailActive;

  bool get isBtnActive => isEmailActive && isPasswordActive;
  void onEmailChange(val) {
    print('Email: $val');
    _isEmailActive = true;
    notifyListeners();
  }

  bool _emailValid = false;
  bool get emailValid => _emailValid;
  emailValidate(String email) {
    _emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    print("$email");
    print("$_emailValid");

    notifyListeners();
  }

  bool _checkVal = false;
  bool get checkVal => _checkVal;
  void toggleCheck() {
    _checkVal = !_checkVal;
    notifyListeners();
  }

  bool _obsecureText = true;
  bool get obsecureText => _obsecureText;
  void togglePassword() {
    _obsecureText = !_obsecureText;
    notifyListeners();
  }

  bool _isPasswordActive = false;
  bool get isPasswordActive => _isPasswordActive;

  void onPasswordChange(val) {
    print('Password: $val');
    _isPasswordActive = true;
    notifyListeners();
  }

  bool _showLoader = false;
  bool get showLoader => _showLoader;
  setLoader(bool val) {
    _showLoader = val;
    notifyListeners();
  }
}
