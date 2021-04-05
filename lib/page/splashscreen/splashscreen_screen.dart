import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ismart_login/page/main.dart';
import 'package:ismart_login/page/sign/future/singin_future.dart';
import 'package:ismart_login/page/sign/model/memberlist.dart';
import 'package:ismart_login/page/sign/model/memberresult.dart';
import 'package:ismart_login/page/sign/signin_screen.dart';
import 'package:ismart_login/system/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashscreenScreen extends StatefulWidget {
  @override
  _SplashscreenScreenState createState() => _SplashscreenScreenState();
}

class _SplashscreenScreenState extends State<SplashscreenScreen> {
  bool sent = false;

  _controllerLoginAuto() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('item')) {
      List<ItemsMemberList> _items = [];
      String item = prefs.getString('item');
      _items =
          List.from(json.decode(item).map((m) => ItemsMemberList.fromJson(m)));
      //----
      Map _map = {
        "USERNAME": _items[0].USERNAME,
        "PASSWORD": _items[0].PASSWORD,
        "STATUS": "auto",
      };
      //-----
      await new SigninFuture().apiSelectMember(_map).then((onValue) {
        print(onValue[0]['msg']);
        if (onValue[0]['msg'] == 'success') {
          SharedCashe.saveItemsMemberList(item: onValue[0]['result']);
          setState(() {
            sent = true;
          });
        } else {
          setState(() {
            sent = false;
          });
        }
      }, onError: (e) {
        print(e);
        setState(() {
          sent = false;
        });
      });
    } else {
      setState(() {
        sent = false;
      });
    }
  }

  @override
  void initState() {
    _controllerLoginAuto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 7,
      navigateAfterSeconds: sent ? MainPage() : SignInScreen(),
      title: new Text(
        'iSmartLogin',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: new Image.network(
          'https://flutter.io/images/catalog-widget-placeholder.png'),
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
    );
  }
}
