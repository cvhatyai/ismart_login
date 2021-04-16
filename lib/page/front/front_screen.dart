import 'dart:async';
import 'dart:convert';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ismart_login/page/front/front_count_widget.dart';
import 'package:ismart_login/page/front/future/org_future.dart';
import 'package:ismart_login/page/front/insite_popup.dart';
import 'package:ismart_login/page/front/model/orglist.dart';
import 'package:ismart_login/page/sign/model/memberlist.dart';
import 'package:ismart_login/page/sign/signout_popup.dart';
import 'package:ismart_login/style/font_style.dart';
import 'package:ismart_login/style/page_style.dart';
import 'package:ismart_login/system/clock.dart';
import 'package:ismart_login/system/gps.dart';
import 'package:ismart_login/system/widht_device.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FrontScreen extends StatefulWidget {
  @override
  _FrontScreenState createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  String myLat;
  String myLong;
  //---

  Timer _timer;
  Timer _date;
  //---
  List<ItemsMemberList> _items = [];
  String _dateString;
  String _timeString;
  //----
  String org_id;
  //Setup
  PickedFile _imageFile;
  dynamic _pickImageError;
  //-----
  TextStyle styleTime = TextStyle(
      fontFamily: FontStyles().FontFamily, fontSize: 24, color: Colors.white);
  TextStyle styleLabelCamera = TextStyle(
      fontFamily: FontStyles().FontFamily,
      fontSize: 26,
      fontWeight: FontWeight.bold,
      height: 1);
  TextStyle styleDetailCamera = TextStyle(
      fontFamily: FontStyles().FontFamily,
      fontSize: 18,
      color: Color(0xFF8D8B8B),
      height: 1);
  //-----
  var map;

  @override
  void initState() {
    _getMyLocation();
    _getShaerd();
    _timeString = _formatTime(DateTime.now());
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    _dateString = _formatDate(DateTime.now());
    _date = Timer.periodic(Duration(seconds: 1), (Timer t) => _getDate());

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _date.cancel();
    super.dispose();
  }

  // --- Post Data Member
  List<ItemsOrgList> _resultOrg = [];
  Future<bool> onLoadSelectOrganization(Map map) async {
    await OrgFuture().apiGetOrganization(map).then((onValue) {
      print(onValue[0].MSG);
      if (onValue[0].MSG == 'success') {
        _resultOrg = onValue[0].RESULT;
      }
    });
    setState(() {});
    return true;
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatTime(DateTime dateTime) {
    return DateFormat('HH.mm').format(dateTime);
  }

  void _getDate() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDate(now);
    List date = formattedDateTime.split("-");
    String day = date[0];
    String month = Clock().thMonth[int.parse(date[1])];
    String year = (int.parse(date[2]) + 543).toString();
    String display = day + ' ' + month + ' ' + year;
    setState(() {
      _dateString = display;
    });
  }

  _getShaerd() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String item = prefs.getString('item');
    _items =
        List.from(json.decode(item).map((m) => ItemsMemberList.fromJson(m)));
    if (_items.length > 0) {
      setState(() {
        org_id = _items[0].ORG_ID;
      });
      Map _map = {"ID": _items[0].ORG_ID != '' ? _items[0].ORG_ID : ''};
      onLoadSelectOrganization(_map);
    }
  }

  _getMyLocation() {
    location.onLocationChanged.listen((LocationData currentLocation) {
      latitude = currentLocation.latitude.toDouble();
      longitude = currentLocation.longitude.toDouble();
    });
    setState(() {
      myLat = latitude.toString();
      myLong = longitude.toString();
    });
    print("==> " + myLat + "," + myLong);
    // List _list = myLocation.split(",");
  }

  String _formatDate(DateTime dateTime) {
    return DateFormat('d-M-y').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: StylePage().background,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 20),
                    width: WidhtDevice().widht(context),
                    decoration: StylePage().boxWhite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  alert_signout(context);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 15),
                                  alignment: Alignment.center,
                                  width: 60,
                                  height: 60,
                                  decoration: new BoxDecoration(
                                    color: Color(0xFFF2F2F2),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 2),
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
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 10, top: 5),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Text(
                                            _items.length > 0
                                                ? _items[0].FULLNAME
                                                : '',
                                            style: TextStyle(
                                                fontFamily:
                                                    FontStyles().FontFamily,
                                                fontSize: 28,
                                                height: 1,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Text(
                                            _items.length > 0
                                                ? _items[0].ORG_NAME
                                                : '',
                                            style: TextStyle(
                                                fontFamily:
                                                    FontStyles().FontFamily,
                                                fontSize: 20,
                                                height: 1,
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
                                      _dateString,
                                      style: styleTime,
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            _timeString + ' น. ',
                                            style: styleTime,
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: FaIcon(
                                              FontAwesomeIcons.sync,
                                              color: Colors.white,
                                              size: 18,
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
                        FrontCountWidget(),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  _timeString.toString(),
                                  style: TextStyle(
                                      fontFamily: FontStyles().FontFamily,
                                      fontSize: 70,
                                      height: 0.5),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.center,
                                child: Text(
                                  _dateString,
                                  style: TextStyle(
                                      fontFamily: FontStyles().FontFamily,
                                      fontSize: 26,
                                      height: 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _imgFromCamera_in(context);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: 5),
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
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          width: 120,
                                          height: 120,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFD6F5FF),
                                              shape: BoxShape.circle),
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Color(0xFFA7E9FF),
                                                shape: BoxShape.circle),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF36C8FF),
                                                  shape: BoxShape.circle),
                                              child: Icon(
                                                Icons.camera_alt,
                                                size: 50,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'เข้างาน',
                                          style: styleLabelCamera,
                                        ),
                                        Text(
                                          'ถ่ายรูปคุณคู่กับสถานที่',
                                          style: styleDetailCamera,
                                        ),
                                        Text(
                                          'เวลาเข้างาน ' +
                                              Clock().convertTime(
                                                  time: _resultOrg.length > 0
                                                      ? _resultOrg[0]
                                                          .TIME_INSITE
                                                      : '--:--') +
                                              ' น.',
                                          style: styleDetailCamera,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _imgFromCamera_out();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: 5),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey[400],
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          width: 120,
                                          height: 120,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFFFEDCE),
                                              shape: BoxShape.circle),
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Color(0xFFFAD7A0),
                                                shape: BoxShape.circle),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFFFAF36),
                                                  shape: BoxShape.circle),
                                              child: Icon(
                                                Icons.camera_alt,
                                                size: 50,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'ออกงาน',
                                          style: styleLabelCamera,
                                        ),
                                        Text(
                                          'ถ่ายรูปคุณคู่กับสถานที่',
                                          style: styleDetailCamera,
                                        ),
                                        Text(
                                          'เวลาออกงาน ' +
                                              Clock().convertTime(
                                                  time: _resultOrg.length > 0
                                                      ? _resultOrg[0]
                                                          .TIME_OUTSITE
                                                      : '--:--') +
                                              ' น.',
                                          style: styleDetailCamera,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'รายการที่บันทึก',
                                style: TextStyle(
                                    fontFamily: FontStyles().FontFamily,
                                    fontSize: 24,
                                    height: 1,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 6),
                                child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 5,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.only(bottom: 6),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 15,
                                              height: 15,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF36C8FF),
                                                  shape: BoxShape.circle),
                                            ),
                                            Expanded(
                                              child: Container(
                                                  padding:
                                                      EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    'เข้างาน เมื่อเวลา 7.45 น.',
                                                    style: TextStyle(
                                                        fontFamily: FontStyles()
                                                            .FontFamily,
                                                        fontSize: 20,
                                                        height: 1),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
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
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 100,
        height: 100,
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 5)
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.add,
                    size: 50.0,
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(1)),
            Text(
              'ทำงานนอกสถานที่',
              style:
                  TextStyle(fontFamily: FontStyles().FontFamily, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }

  _imgFromCamera_in(BuildContext context) async {
    try {
      final pickedFile = await ImagePicker().getImage(
        source: ImageSource.camera,
        imageQuality: 50,
      );
      setState(() {
        _imageFile = pickedFile;
      });
      alert_insite(
          context: context,
          pathImage: pickedFile.path,
          lat: _resultOrg[0].LATITUDE,
          long: _resultOrg[0].LONGITUDE);
    } catch (e) {
      setState(() {
        _pickImageError = e;
        print(_pickImageError.toString());
      });
    }
  }

  _imgFromCamera_out() async {
    try {
      final pickedFile = await ImagePicker().getImage(
        source: ImageSource.camera,
        imageQuality: 50,
      );
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
        print(_pickImageError.toString());
      });
    }
  }
}
