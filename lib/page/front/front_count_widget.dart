import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ismart_login/page/front/future/summary_future.dart';
import 'package:ismart_login/page/front/model/sumaryAllDay.dart';
import 'package:ismart_login/page/front/model/sumaryToDay.dart';
import 'package:ismart_login/page/front/model/sumaryToDay_absence.dart';
import 'package:ismart_login/page/front/model/sumaryToDay_late.dart';
import 'package:ismart_login/page/front/model/sumaryToDay_ontime.dart';
import 'package:ismart_login/style/font_style.dart';
import 'package:ismart_login/system/shared_preferences.dart';

class FrontCountWidget extends StatefulWidget {
  @override
  _FrontCountWidgetState createState() => _FrontCountWidgetState();
}

class _FrontCountWidgetState extends State<FrontCountWidget> {
  TextStyle styleLabel =
      TextStyle(fontFamily: FontStyles().FontFamily, fontSize: 16, height: 1);
  //---
  var newFormat = DateFormat("yyyy-MM-dd");

  ///----
  _function() async {
    Map _map = {
      "org_id": await SharedCashe.getItemsWay(name: 'org_id'),
      "create_date": newFormat.format(DateTime.now())
    };
    onLoadGetSummaryToDay(_map);
  }

  @override
  void initState() {
    _function();
    super.initState();
  }

  // --- Post Data Member
  List<ItemsSummaryToDay> _result = [];
  List<ItemsSummaryToDay_Ontime> _result_ontime = [];
  List<ItemsSummaryToDay_Late> _result_late = [];
  List<ItemsSummaryToDay_Absence> _result_absence = [];
  Future<bool> onLoadGetSummaryToDay(Map map) async {
    await SummaryFuture().apiGetSummaryToDay(map).then((onValue) {
      _result = onValue;
      print(_result.length);
      setState(() {
        _result_ontime = _result[0].ONTIME;
        _result_late = _result[0].LATE;
        _result_absence = _result[0].ABSENCE;
      });
    });
    setState(() {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[400],
                    width: 1,
                  ),
                  right: BorderSide(
                    color: Colors.grey[400],
                    width: 1,
                  ),
                ),
              ),
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  _result_absence.length > 0
                                      ? _result_absence.length.toString()
                                      : '0',
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontFamily: FontStyles().FontThaiSans,
                                      height: 0.6),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                width: 20,
                                height: 3,
                                color: Color(0xFFFF802C),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text('คน',
                                  style: TextStyle(
                                      fontFamily: FontStyles().FontFamily,
                                      fontSize: 20)),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF18C0FF),
                                size: 18,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      'ยังไม่ลงเวลา',
                      style: styleLabel,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[400],
                    width: 1,
                  ),
                  right: BorderSide(
                    color: Colors.grey[400],
                    width: 1,
                  ),
                ),
              ),
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  _result_ontime.length > 0
                                      ? _result_ontime.length.toString()
                                      : '0',
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontFamily: FontStyles().FontThaiSans,
                                      height: 0.6),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                width: 20,
                                height: 3,
                                color: Color(0xFFA7D645),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text('คน',
                                  style: TextStyle(
                                      fontFamily: FontStyles().FontFamily,
                                      fontSize: 20)),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF18C0FF),
                                size: 18,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      'ทันเวลา',
                      style: styleLabel,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[400],
                    width: 1,
                  ),
                  right: BorderSide(
                    color: Colors.grey[400],
                    width: 1,
                  ),
                ),
              ),
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  _result_late.length > 0
                                      ? _result_late.length.toString()
                                      : '0',
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontFamily: FontStyles().FontThaiSans,
                                      height: 0.6),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                width: 20,
                                height: 3,
                                color: Color(0xFFD40000),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text('คน',
                                  style: TextStyle(
                                      fontFamily: FontStyles().FontFamily,
                                      fontSize: 20)),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF18C0FF),
                                size: 18,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      'สาย',
                      style: styleLabel,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[400],
                    width: 1,
                  ),
                ),
              ),
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  '0',
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontFamily: FontStyles().FontThaiSans,
                                      height: 0.6),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                width: 20,
                                height: 3,
                                color: Color(0xFFFF802C),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text('คน',
                                  style: TextStyle(
                                      fontFamily: FontStyles().FontFamily,
                                      fontSize: 20)),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF18C0FF),
                                size: 18,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      'ลา',
                      style: styleLabel,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
