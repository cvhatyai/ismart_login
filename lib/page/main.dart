import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ismart_login/page/front/front_screen.dart';
import 'package:ismart_login/page/history/history_screen.dart';
import 'package:ismart_login/page/sign/model/memberlist.dart';
import 'package:ismart_login/style/font_style.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ///--
  int selectedIndex = 1;

  List _widgetOptions = [
    Text(
      'Index 0: Home',
    ),
    FrontScreen(),
    HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Color(0xFF4EA9FB),
          selectedItemBackgroundColor: Color(0xFF4EA9FB),
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Color(0xFF4EA9FB),
          unselectedItemIconColor: Color(0xFF4EA9FB),
          unselectedItemLabelColor: Color(0xFF4EA9FB),
          selectedItemTextStyle: TextStyle(fontSize: 14),
          unselectedItemTextStyle: TextStyle(fontSize: 14),
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: FaIcon(FontAwesomeIcons.envelope).icon,
            label: 'ลา',
          ),
          FFNavigationBarItem(
            iconData: FaIcon(FontAwesomeIcons.clock).icon,
            label: 'ลงเวลา',
          ),
          FFNavigationBarItem(
            iconData: FaIcon(FontAwesomeIcons.history).icon,
            label: 'ประวัติ',
          ),
        ],
      ),
    );
  }
}
