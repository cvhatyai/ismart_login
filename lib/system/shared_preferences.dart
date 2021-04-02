import 'dart:convert';

import 'package:ismart_login/page/sign/model/memberlist.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedCashe {
  static saveItemsMemberList({List<ItemsMemberList> item}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(item[0].FULLNAME);
  }

  getItemsMemberList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String item = prefs.getString('item');
    print(item);
    return item;
  }
}
