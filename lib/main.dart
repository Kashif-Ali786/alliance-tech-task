import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_a/pages/login_page.dart';
import 'package:flutter_a/pages/profile_page.dart';
import 'package:flutter_a/services/login_services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'provider/login_provider.dart';
import 'provider/register_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => RegisterProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Navigater(),
      ),
    );
  }
}

class Navigater extends StatefulWidget {
  @override
  _NavigaterState createState() => _NavigaterState();
}

class _NavigaterState extends State<Navigater> {
  void navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var tokein = await getAccessToken() ?? "";
    var status = await prefs.getBool('option') ?? false;
    var token2 = await prefs.getString('token') ?? "nothing";
    print("token $tokein");
    print("token2 $token2");
    if (status == true) {
      Get.off(() => HomePage());
    } else {
      Get.off(() => LoginPage());
    }
  }

  @override
  void initState() {
    super.initState();
    navigateUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
