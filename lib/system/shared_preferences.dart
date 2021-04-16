import 'dart:convert';

import 'package:ismart_login/page/sign/model/memberlist.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedCashe {
  static saveItemsMemberList({List<dynamic> item}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String listString = json.encode(item[0]);

    Map _map = json.decode(listString);
    print(_map);
    List<dynamic> _key = _map.keys.toList();
    List<dynamic> _val = _map.values.toList();
    for (int i = 0; i < _map.keys.length; i++) {
      prefs.setString(_key[i], _val[i]);
    }
    prefs.setString('item', json.encode(item));
  }

  getItemsMemberList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String item = prefs.getString('item');
    return item;
  }

  static getItemsWay({String name}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String item = prefs.getString(name);
    print(item);
    return item;
  }

  static clearShaeredAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
