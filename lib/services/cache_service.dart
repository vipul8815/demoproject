import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static Future<bool> setLoginData(Map? data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('userData', json.encode(data));
  }

  static Future<Map?> getLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? info = prefs.getString('userData');
    try {
      return json.decode(info!) as Map?;
    } catch (err) {
      return Future(() => null);
    }
  }

  static Future<bool> removeLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('userData');
  }

  static Future<bool> setUser(Map? data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List list = [];
    String? info = prefs.getString('userDataList');
    if (info == null) {
      list.add(data);
    } else {
      list = json.decode(info);
      list.add(data);
    }

    return prefs.setString('userDataList', json.encode(list));
  }

  static Future<List?> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? info = prefs.getString('userDataList');
    try {
      return json.decode(info!) as List?;
    } catch (err) {
      return Future(() => []);
    }
  }
}
