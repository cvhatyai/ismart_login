import 'package:flutter/material.dart';
import 'package:ismart_login/page/org/join_detail_screen.dart';
import 'package:ismart_login/page/org/join_screen.dart';
import 'package:ismart_login/style/font_style.dart';
import 'package:ismart_login/style/page_style.dart';
import 'package:ismart_login/system/widht_device.dart';

class OrganizationScreen extends StatefulWidget {
  @override
  _OrganizationScreenState createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreen> {
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
                    'เริ่มต้นใช้งาน',
                    style: TextStyle(
                        fontFamily: FontStyles().FontFamily,
                        fontSize: 46,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 20),
                    width: WidhtDevice().widht(context),
                    decoration: StylePage().boxWhite,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          height: 200,
                          child:
                              Image.asset('assets/images/other/org_select.png'),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrganizationJoinScreen(),
                              ),
                            );
                          },
                          child: Card(
                            shadowColor: Color(0xFFE8E8E8),
                            elevation: 3.0,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .body1
                                                  .copyWith(
                                                      fontSize: 40,
                                                      fontFamily: FontStyles()
                                                          .FontFamily,
                                                      fontWeight:
                                                          FontWeight.bold),
                                              children: [
                                                TextSpan(
                                                  text: 'เข้าร่วม',
                                                  style: TextStyle(
                                                    color: Color(0xFF0799E5),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'ทีม/องค์กร',
                                                  style: TextStyle(
                                                    color: Color(0xFF6B6B6B),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(right: 10),
                                            child: Text(
                                              'เข้าร่วมทีมที่เพื่อนคุณสร้างไว้แล้ว โดยถาม ID องค์กร/ทีม กับเพื่อนของคุณ',
                                              style: TextStyle(
                                                  color: Color(0xFF6B6B6B),
                                                  fontFamily:
                                                      FontStyles().FontFamily,
                                                  fontSize: 22,
                                                  height: 1),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.blue,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        GestureDetector(
                          child: Card(
                            shadowColor: Color(0xFFE8E8E8),
                            elevation: 3.0,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .body1
                                                  .copyWith(
                                                      fontSize: 40,
                                                      fontFamily: FontStyles()
                                                          .FontFamily,
                                                      fontWeight:
                                                          FontWeight.bold),
                                              children: [
                                                TextSpan(
                                                  text: 'สร้าง',
                                                  style: TextStyle(
                                                    color: Color(0xFFFF6600),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'ทีม/องค์กรใหม่',
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(right: 10),
                                            child: Text(
                                              'แล้วชวนทีมงานมาเข้าร่วม',
                                              style: TextStyle(
                                                  color: Color(0xFF6B6B6B),
                                                  fontFamily:
                                                      FontStyles().FontFamily,
                                                  fontSize: 22,
                                                  height: 1),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.blue,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
