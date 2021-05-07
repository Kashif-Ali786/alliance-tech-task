import 'package:flutter/material.dart';
import 'package:flutter_a/services/login_services.dart';
import 'package:flutter_a/services/profile_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProfileModel _profileModel;
  @override
  void initState() {
    super.initState();
    _profileModel = ProfileModel();
    _profileModel = null;
    getProfile().then((value) => setState(() => _profileModel = value));
    tokenPrint();
  }

  tokenPrint() async {
    var token = await getAccessToken();
    var islog = await getIsLoggedIn();
    print("token in profile $token : isLoggen in $islog");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: _profileModel == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Welcome to the demo task"),
                  Text("name: ${_profileModel.data.name}"),
                  Text("username: ${_profileModel.data.username}"),
                  Text("email: ${_profileModel.data.email}"),
                  ElevatedButton(
                    child: Text("Logout"),
                    style: TextButton.styleFrom(),
                    onPressed: () async {
                      print("Hi Codepur");
                      Get.offAll(() => LoginPage());
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool('option', false);
                      await prefs.setString('token', "");
                    },
                  )
                ],
              ),
            ),
    );
  }
}
