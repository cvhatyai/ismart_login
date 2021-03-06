import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ismart_login/style/font_style.dart';

class FrontCountWidget extends StatefulWidget {
  @override
  _FrontCountWidgetState createState() => _FrontCountWidgetState();
}

class _FrontCountWidgetState extends State<FrontCountWidget> {
  TextStyle styleLabel =
      TextStyle(fontFamily: FontStyles().FontFamily, fontSize: 16, height: 1);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
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
                                  '23',
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
                              Text('??????',
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
                      '????????????????????????????????????',
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
                                  '23',
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
                              Text('??????',
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
                      '?????????????????????',
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
                                  '23',
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
                              Text('??????',
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
                      '?????????',
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
                                  '23',
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
                              Text('??????',
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
                      '??????',
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
