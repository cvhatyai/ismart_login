import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ismart_login/page/front/front_screen.dart';
import 'package:ismart_login/page/sign/future/singin_future.dart';
import 'package:ismart_login/page/sign/model/memberresult.dart';
import 'package:ismart_login/page/sign/signup_screen.dart';
import 'package:ismart_login/style/page_style.dart';
import 'package:ismart_login/style/font_style.dart';
import 'package:ismart_login/system/widht_device.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _inputUsername = TextEditingController();
  TextEditingController _inputPassword = TextEditingController();
  //--- Map get Value
  _postDataInput() {
    Map _map = {
      "USERNAME": _inputUsername.text,
      "PASSWORD": _inputPassword.text,
    };
    return _map;
  }

  //--API
  List<ItemsMemberResult> _result = [];
  Future<bool> onLoadInsertMember(Map map) async {
    await new SigninFuture().apiSelectMember(map).then((onValue) {
      _result = onValue;
      print(_result[0].MSG);
      if (_result[0].MSG == 'success') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FrontScreen(
              item: _result[0].RESULT,
            ),
          ),
        );
      }
    });
    setState(() {});
    return true;
  }

  Widget formlogin() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _inputUsername,
            keyboardType: TextInputType.number,
            style: TextStyle(fontFamily: FontStyles().FontFamily, fontSize: 24),
            decoration: InputDecoration(
              hintText: 'เบอร์โทรศัพท์',
              hintStyle:
                  TextStyle(fontFamily: FontStyles().FontFamily, fontSize: 24),
              prefixIcon: Padding(
                padding: EdgeInsets.all(0), // add padding to adjust icon
                child: Icon(
                  Icons.phone_iphone,
                  size: 26,
                ),
              ),
            ),
          ),
          TextFormField(
            controller: _inputPassword,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(fontFamily: FontStyles().FontFamily, fontSize: 24),
            decoration: InputDecoration(
              hintText: 'รหัสผ่าน',
              hintStyle:
                  TextStyle(fontFamily: FontStyles().FontFamily, fontSize: 24),
              prefixIcon: Padding(
                padding: EdgeInsets.all(0), // add padding to adjust icon
                child: Icon(
                  Icons.lock,
                  size: 26,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          GestureDetector(
            onTap: () {
              if (_formKey.currentState.validate()) {
                onLoadInsertMember(_postDataInput());
                SpinKitWave(
                  color: Colors.white,
                  size: 50.0,
                );
                print('เข้าสู่ระบบ');
              }
            },
            child: Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                color: Color(0xFF079CFD),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                'เข้าสู่ระบบ',
                style: TextStyle(
                    fontFamily: FontStyles().FontFamily,
                    color: Colors.white,
                    fontSize: 36),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: StylePage().background,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'iSmartLogin',
                    style: TextStyle(
                        fontFamily: FontStyles().FontFamily,
                        fontSize: 46,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 20),
                  width: WidhtDevice().widht(context),
                  decoration: StylePage().boxWhite,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        alignment: Alignment.center,
                        width: 100,
                        height: 100,
                        decoration: new BoxDecoration(
                          color: Color(0xFF18C0FF),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 75,
                        ),
                      ),
                      Text(
                        'เข้าใช้งาน',
                        style: TextStyle(
                            fontFamily: FontStyles().FontFamily, fontSize: 46),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                        child: formlogin(),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Text('ลืมรหัสผ่าน',
                                  style: TextStyle(
                                      fontFamily: FontStyles().FontFamily,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                '|',
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()),
                                );
                              },
                              child: Text('ลงทะเบียน',
                                  style: TextStyle(
                                      fontFamily: FontStyles().FontFamily,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24)),
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                print('facebook');
                              },
                              color: Color(0xFF3B5998),
                              child: FaIcon(
                                FontAwesomeIcons.facebookF,
                                color: Colors.white,
                                size: 26,
                              ),
                              padding: EdgeInsets.all(12),
                              shape: CircleBorder(),
                            ),
                            MaterialButton(
                              onPressed: () {
                                print('line');
                              },
                              color: Color(0xFF00C300),
                              child: Image.asset(
                                'assets/images/social/line.png',
                                width: 26,
                                fit: BoxFit.fill,
                              ),
                              padding: EdgeInsets.all(12),
                              shape: CircleBorder(),
                            ),
                            MaterialButton(
                              onPressed: () {
                                print('apple');
                              },
                              color: Color(0xFFA3AAAE),
                              child: FaIcon(
                                FontAwesomeIcons.apple,
                                color: Colors.white,
                                size: 26,
                              ),
                              padding: EdgeInsets.all(12),
                              shape: CircleBorder(),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
