import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ismart_login/page/front/model/sumaryToDay_ontime.dart';
import 'package:ismart_login/server/server.dart';
import 'package:ismart_login/style/font_style.dart';
import 'package:ismart_login/style/page_style.dart';
import 'package:ismart_login/system/widht_device.dart';
import 'package:loading_gifs/loading_gifs.dart';

class FrontCountOntimeScreen extends StatefulWidget {
  final List<ItemsSummaryToDay_Ontime> items;
  FrontCountOntimeScreen({Key key, @required this.items}) : super(key: key);
  @override
  _FrontCountOntimeScreenState createState() => _FrontCountOntimeScreenState();
}

class _FrontCountOntimeScreenState extends State<FrontCountOntimeScreen> {
  List<ItemsSummaryToDay_Ontime> _items;
  @override
  void initState() {
    EasyLoading.dismiss();
    _items = widget.items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: StylePage().background,
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                centerTitle: true,
                title: Text(
                  'ทันเวลา',
                  style: TextStyle(
                      fontFamily: FontStyles().FontFamily,
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.white.withOpacity(0),
                elevation: 0,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  padding:
                      EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                  width: WidhtDevice().widht(context),
                  decoration: StylePage().boxWhite,
                  child: _items.length > 0
                      ? _list()
                      : Center(
                          child: Text(
                            '-- ไม่มีข้อมูล --',
                            style: TextStyle(
                                fontFamily: FontStyles().FontFamily,
                                fontSize: 24,
                                color: Colors.grey[400]),
                          ),
                        ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _list() {
    return Scrollbar(
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        padding: EdgeInsets.all(8),
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        _items[index].FULLNAME,
                        style: TextStyle(
                            fontFamily: FontStyles().FontThaiSans,
                            fontSize: 24),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      alert_show_images(context, _items[index].START_IMAGE);
                    },
                    child: Container(
                      height: 100,
                      child: FadeInImage.assetNetwork(
                          placeholder: cupertinoActivityIndicatorSmall,
                          placeholderScale: 5,
                          width: WidhtDevice().widht(context) / 2,
                          fit: BoxFit.contain,
                          image: Server.url + _items[index].START_IMAGE),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            _items[index].START_TIME + ' น.',
                            style: TextStyle(
                                fontFamily: FontStyles().FontThaiSans,
                                fontSize: 24),
                          ),
                        ),
                        _items[index].START_LOCATION_STATUS == '1'
                            ? GestureDetector(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: WidhtDevice().widht(context) / 3.5,
                                  child: Text(
                                    'ไม่อยู่ในพื้นที่ : ' +
                                        _getStatusLocation(_items[index]
                                            .START_LOCATION_SUB_STATUS),
                                    style: TextStyle(
                                        fontFamily: FontStyles().FontFamily,
                                        fontSize: 18,
                                        height: 1,
                                        color: Colors.red[200]),
                                  ),
                                ),
                              )
                            : Container(
                                height: 0,
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _getStatusLocation(String _status) {
    String _txt = '';
    if (_status != '' && _status != null) {
      List _list = json.decode(_status);
      List _checkboxListTile = ['โปรแกรมระบุตำแหน่งผิดพลาด', 'ทำงานนอกสถานที่'];
      if (_list.length > 0) {
        for (int i = 0; i < _list.length; i++) {
          _txt += _checkboxListTile[int.parse(_list[i])] + ', ';
        }
      }
    }

    return _txt;
  }

  alert_show_images(BuildContext context, String images) async {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          content: Container(
            width: WidhtDevice().widht(context),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 3, right: 3),
                  alignment: Alignment.center,
                  child: Image.network(
                    Server.url + images,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      return Center(
                        child: FadeInImage.assetNetwork(
                            placeholder: cupertinoActivityIndicatorSmall,
                            placeholderScale: 5,
                            image: Server.url + images),
                      );
                    },
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                              ),
                            ),
                            height: 50,
                            alignment: Alignment.center,
                            child: Text(
                              'ปิด',
                              style: TextStyle(
                                  fontFamily: FontStyles().FontFamily,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
