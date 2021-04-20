import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ismart_login/page/main.dart';
import 'package:ismart_login/page/sign/future/singin_future.dart';
import 'package:ismart_login/page/sign/model/memberlist.dart';
import 'package:ismart_login/page/sign/model/memberresult.dart';
import 'package:ismart_login/page/sign/signin_screen.dart';
import 'package:ismart_login/style/font_style.dart';
import 'package:ismart_login/system/gps.dart';
import 'package:ismart_login/system/shared_preferences.dart';
import 'package:ismart_login/system/widht_device.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashscreenScreen extends StatefulWidget {
  @override
  _SplashscreenScreenState createState() => _SplashscreenScreenState();
}

class _SplashscreenScreenState extends State<SplashscreenScreen> {
  bool sent = false;
  FToast fToast;

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
          _showToast();
          setState(() {
            sent = true;
          });
        } else if (onValue[0]['msg'] == 'fail') {
          setState(() {
            sent = false;
          });
          alert_non_signin(context, 'ไม่พบ Username');
        } else {
          setState(() {
            sent = false;
          });
          alert_non_signin(context, 'กรุณาป้อน Password ใหม่');
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
    LocationService.checkService();
    super.initState();
    fToast = FToast();
    fToast.init(context);
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

  _showToast() async {
    // this will be our toast UI
    String name = await SharedCashe.getItemsWay(name: 'fullname');
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text(
            'สวัสดีคุณ ' + name,
            style: TextStyle(fontFamily: FontStyles().FontFamily, fontSize: 22),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
    );
  }

  alert_non_signin(BuildContext context, String text) async {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          content: Container(
            width: WidhtDevice().widht(context),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 3, right: 3),
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    style: TextStyle(
                        fontFamily: FontStyles().FontFamily,
                        fontSize: 24,
                        height: 1),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                              ),
                            ),
                            height: 50,
                            alignment: Alignment.center,
                            child: Text(
                              'ปิด',
                              style: TextStyle(
                                  fontFamily: FontStyles().FontFamily,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
