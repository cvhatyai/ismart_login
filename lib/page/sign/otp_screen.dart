import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ismart_login/page/sign/future/member_future.dart';
import 'package:ismart_login/page/sign/model/for_post.dart';
import 'package:ismart_login/page/sign/model/memberlist.dart';
import 'package:ismart_login/page/sign/model/otplist.dart';
import 'package:ismart_login/style/page_style.dart';
import 'package:ismart_login/style/font_style.dart';
import 'package:ismart_login/system/widht_device.dart';

class OtpScreen extends StatefulWidget {
  final Map map;
  OtpScreen({Key key, @required this.map}) : super(key: key);
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  //-----
  Map _items = {};
  //---
  TextEditingController _inputOtp = TextEditingController();
  _getData() {
    Map _map = {
      "OTP": _inputOtp.text,
      "PHONE": _items['PHONE'],
    };
    return _map;
  }

  //Setup
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 600;
// API
// --- Post Data Member
  List<ItemsMemberResultList> _result = [];
  Future<bool> onLoadInsertMember(Map map) async {
    await new MemberFuture().apiInsertMember(map).then((onValue) {
      _result = onValue;
      print(onValue.length);
    });
    setState(() {});
    return true;
  }

  //-- check OTP
  List<ItemsOTPList> _resultOtp = [];
  Future<bool> onLoadCheckOtp(Map map) async {
    await new MemberFuture().apiGetCheckOtp(map).then((onValue) {
      _resultOtp = onValue;
      print(onValue.length);
      print(_resultOtp[0].RESULT);
    });
    setState(() {});
    return true;
  }

// API
  @override
  void initState() {
    _items = widget.map;
    super.initState();
  }

  Widget formlogin() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            child: TextFormField(
              controller: _inputOtp,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: FontStyles().FontFamily,
                  fontSize: 30,
                  height: 0.7),
              decoration: InputDecoration(
                alignLabelWithHint: true,
                hintText: 'OTP',
                labelStyle: TextStyle(
                    fontFamily: FontStyles().FontThaiSans,
                    fontSize: 24,
                    height: 0),
              ),
            ),
          ),
          CountdownTimer(
            endTime: endTime,
            widgetBuilder: (_, CurrentRemainingTime time) {
              if (time == null) {
                return Text('Game over');
              }
              return Text(
                'รหัส OTP จะหมดอายุภายใน ${time.min} นาที ${time.sec} วินาที',
                style: TextStyle(
                    fontFamily: FontStyles().FontFamily,
                    fontSize: 20,
                    color: Colors.grey),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      onLoadCheckOtp(_getData());
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    padding: EdgeInsets.only(left: 25, right: 25),
                    decoration: BoxDecoration(
                      color: Color(0xFF079CFD),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'ถัดไป',
                      style: TextStyle(
                          fontFamily: FontStyles().FontFamily,
                          color: Colors.white,
                          fontSize: 36),
                    ),
                  ),
                ),
              ),
            ],
          )
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'iSmartLogin',
                        style: TextStyle(
                            fontFamily: FontStyles().FontFamily,
                            fontSize: 46,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: FaIcon(
                          FontAwesomeIcons.times,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ],
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
                        child: FaIcon(
                          FontAwesomeIcons.sms,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                        child: Text(
                          'กรุณากรอก One Time Password หรือ OTP ที่ส่งไปยัง ${_items['PHONE']} ของคุณ',
                          style: TextStyle(
                              fontFamily: FontStyles().FontFamily,
                              fontSize: 24,
                              height: 1),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                        child: formlogin(),
                      ),
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