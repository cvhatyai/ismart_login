import 'package:flutter/material.dart';
import 'package:ismart_login/style/font_style.dart';

class HistoryDayWidget extends StatefulWidget {
  @override
  _HistoryDayWidgetState createState() => _HistoryDayWidgetState();
}

class _HistoryDayWidgetState extends State<HistoryDayWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 6),
              child: Row(
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        color: Color(0xFF36C8FF), shape: BoxShape.circle),
                  ),
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'เข้างาน เมื่อเวลา 7.45 น.',
                          style: TextStyle(
                              fontFamily: FontStyles().FontFamily,
                              fontSize: 20,
                              height: 1),
                        )),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
