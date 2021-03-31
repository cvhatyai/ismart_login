import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ismart_login/style/font_style.dart';
import 'package:ismart_login/style/page_style.dart';

class FrontScreen extends StatefulWidget {
  @override
  _FrontScreenState createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  TextStyle styleTime = TextStyle(
      fontFamily: FontStyles().FontFamily, fontSize: 24, color: Colors.white);
  TextStyle styleLabel =
      TextStyle(fontFamily: FontStyles().FontFamily, fontSize: 18);

  Widget countPerson() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Colors.grey[400],
                    width: 1,
                  ),
                  bottom: BorderSide(
                    color: Colors.grey[400],
                    width: 1,
                  ),
                ),
              ),
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                child: Text(
                                  '23',
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontFamily: FontStyles().FontThaiSans),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                child: Container(
                                  width: 20,
                                  height: 3,
                                  color: Color(0xFFFF802C),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                    ],
                  ),
                  Container(
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
                  right: BorderSide(
                    color: Colors.grey[400],
                    width: 1,
                  ),
                  bottom: BorderSide(
                    color: Colors.grey[400],
                    width: 1,
                  ),
                ),
              ),
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                child: Text(
                                  '23',
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontFamily: FontStyles().FontThaiSans),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                child: Container(
                                  width: 20,
                                  height: 3,
                                  color: Color(0xFFFF802C),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                    ],
                  ),
                  Container(
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
                  right: BorderSide(
                    color: Colors.grey[400],
                    width: 1,
                  ),
                  bottom: BorderSide(
                    color: Colors.grey[400],
                    width: 1,
                  ),
                ),
              ),
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                child: Text(
                                  '23',
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontFamily: FontStyles().FontThaiSans),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                child: Container(
                                  width: 20,
                                  height: 3,
                                  color: Color(0xFFFF802C),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                    ],
                  ),
                  Container(
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                child: Text(
                                  '23',
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontFamily: FontStyles().FontThaiSans),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                child: Container(
                                  width: 20,
                                  height: 3,
                                  color: Color(0xFFFF802C),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                    ],
                  ),
                  Container(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: StylePage().background,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 20),
                width: MediaQuery.of(context).size.width,
                decoration: StylePage().boxWhite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            alignment: Alignment.center,
                            width: 60,
                            height: 60,
                            decoration: new BoxDecoration(
                              color: Color(0xFFF2F2F2),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: SingleChildScrollView(
                                      child: Text(
                                        'ธีรเวช ดำรงทอง',
                                        style: TextStyle(
                                            fontFamily: FontStyles().FontFamily,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: SingleChildScrollView(
                                      child: Text(
                                        'Cityvariety',
                                        style: TextStyle(
                                            fontFamily: FontStyles().FontFamily,
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal),
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
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 25, right: 25),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF398EFD),
                                    Color(0xFFFFA2C2),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.repeated),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '12 กุมภาพันธ์ 2563',
                                  style: styleTime,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        '7.58 น. ',
                                        style: styleTime,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: FaIcon(
                                          FontAwesomeIcons.sync,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    countPerson(),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Text(
                              '07.58',
                              style: TextStyle(
                                  fontFamily: FontStyles().FontFamily,
                                  fontSize: 50),
                            ),
                            Text('12 กุมภาพันธ์ 64',
                                style: TextStyle(
                                    fontFamily: FontStyles().FontFamily,
                                    fontSize: 26))
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
