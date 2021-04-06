import 'dart:convert';

import 'package:ismart_login/page/sign/model/memberlist.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedCashe {
  static saveItemsMemberList({List<dynamic> item}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(json.encode(item));
    prefs.setString('item', json.encode(item));
  }

  static getItemsMemberList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String item = prefs.getString('item');
    return item;
  }

  static clearShaeredAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
