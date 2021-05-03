import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ismart_login/page/profile/profile_screen.dart';
import 'package:ismart_login/page/sign/signout_popup.dart';
import 'package:ismart_login/style/font_style.dart';
import 'package:ismart_login/style/page_style.dart';

class MenuDrawer extends StatefulWidget {
  final String images;
  final String fullname;
  final String org;
  MenuDrawer({
    Key key,
    @required this.images,
    this.fullname,
    this.org,
  }) : super(key: key);
  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  TextStyle _txt = TextStyle(
    fontFamily: FontStyles().FontFamily,
    fontSize: 22,
  );
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
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
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          widget.fullname,
                          style: TextStyle(
                            fontFamily: FontStyles().FontFamily,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          widget.org,
                          style: TextStyle(
                            fontFamily: FontStyles().FontFamily,
                            fontSize: 22,
                            height: 1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            decoration: StylePage().background,
          ),
          ListTile(
            minLeadingWidth: 0.5,
            leading: FaIcon(FontAwesomeIcons.userEdit),
            title: Text(
              'แก้ไขข้อมูลส่วนตัว',
              style: _txt,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
          ),
          ListTile(
            minLeadingWidth: 0.5,
            tileColor: Colors.red[100].withOpacity(0.3),
            leading: FaIcon(FontAwesomeIcons.signOutAlt),
            title: Text(
              'ออกจากระบบ',
              style: _txt,
            ),
            onTap: () {
              Navigator.pop(context);
              alert_signout(context);
            },
          ),
        ],
      ),
    );
  }
}
