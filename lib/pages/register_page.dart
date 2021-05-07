import 'package:flutter/material.dart';
import 'package:flutter_a/pages/login_page.dart';
import 'package:flutter_a/provider/register_provider.dart';
import 'package:flutter_a/services/signup_services.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RegisterProvider _provider = Provider.of<RegisterProvider>(context);
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                "Register",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  TextFormField(
                    autovalidate: true,
                    validator: (input) =>
                        input.isValidEmail() ? null : "Invalid email",
                    decoration: InputDecoration(
                      hintText: "email",
                      labelText: "email",
                    ),
                    controller: _provider.emailCont,
                  ),
                  TextFormField(
                    controller: _provider.usernameCont,
                    decoration: InputDecoration(
                      hintText: "Enter username",
                      labelText: "Username",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _provider.passwordCont,
                    decoration: InputDecoration(
                      hintText: "Enter password",
                      labelText: "Password",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _provider.confirmpasswordCont,
                    decoration: InputDecoration(
                      hintText: "Enter Confirm password",
                      labelText: "confirm Password",
                    ),
                  ),
                  TextFormField(
                    controller: _provider.nameCont,
                    decoration: InputDecoration(
                      hintText: "name",
                      labelText: "name",
                    ),
                  ),
                  TextFormField(
                    controller: _provider.companyName4,
                    decoration: InputDecoration(
                      hintText: "company name",
                      labelText: "company name",
                    ),
                  ),
                  TextFormField(
                    controller: _provider.companyNo,
                    decoration: InputDecoration(
                      hintText: "company no",
                      labelText: "company number",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    child: Text("Register"),
                    style: TextButton.styleFrom(),
                    onPressed: () {
                      print("Hi Codepur");
                      if (_provider.nameCont.text.isNotEmpty &&
                          _provider.emailCont.text.isNotEmpty &&
                          _provider.passwordCont.text.isNotEmpty) {
                        _onLoading(context);
                        SignUpServices().signUpUser(provider: _provider);

//                        if (_provider.passwordCont.text.length > 5 &&
//                            _provider.emailValid) {
//                          _onLoading(context);
//                          SignUpServices().signUpUser(provider: _provider);
//                        } else {
//                          Get.rawSnackbar(
//                            message: 'Password must be at least 6 character!',
//                          );
//                        }
//                      } else {
//                        Get.rawSnackbar(
//                          message: 'Please fill all fields',
//                        );
                      }

//                      Get.to(() => HomePage());
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }

  void _onLoading(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(),
                SizedBox(width: 15),
                new Text("Loading..."),
              ],
            ),
          ),
        );
      },
    );
  }
}
