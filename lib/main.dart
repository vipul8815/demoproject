import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:demo_app/screen/auth/login_page.dart';
import 'package:demo_app/screen/home_page.dart';
import 'package:demo_app/services/cache_service.dart';
import 'package:demo_app/constants.dart';
import 'package:demo_app/style/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map? userLoginData;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    CacheService.getLoginData().then((value) {
      setState(() {
        userLoginData = value ?? null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme:
          ThemeData(primaryColor: primaryColor, brightness: Brightness.light),
      home: userLoginData == null ? LoginPage() : HomePage(),
    );
  }
}
