import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ismart_login/page/history/future/history_future.dart';
import 'package:ismart_login/page/history/model/itemMyHistory.dart';
import 'package:ismart_login/server/server.dart';
import 'package:ismart_login/style/font_style.dart';
import 'package:ismart_login/system/shared_preferences.dart';
import 'package:ismart_login/system/widht_device.dart';
import 'package:loading_gifs/loading_gifs.dart';

class HistoryMeScreen extends StatefulWidget {
  @override
  _HistoryMeScreenState createState() => _HistoryMeScreenState();
}

class _HistoryMeScreenState extends State<HistoryMeScreen> {
  TextStyle _topRow = TextStyle(
      fontFamily: FontStyles().FontFamily,
      fontSize: 24,
      color: Colors.black,
      height: 1);
  //--
  List statusTimeOut = ['ลาไม่เต็มวัน', 'ทำงานนอกสถานที่'];
  List statusTimeIn = [
    'สาย',
    'ลาไม่เต็มวัน',
    'ลืมลงชื่อเข้างาน',
    'ทำงานนอกสถานที่'
  ];
  //---
  bool isLoading = false; //LoadMore
  // --- Post Data Member
  int start = 0;
  List<ItemsMyHistory> _result = [];
  Future<bool> onLoadHistoryMe(int _start) async {
    Map map = {
      "uid": await SharedCashe.getItemsWay(name: 'id'),
      "org_id": await SharedCashe.getItemsWay(name: 'org_id'),
      "start": _start
    };
    print(map);
    await HistoryFuture().apiGetHistoryMeList(map).then((onValue) {
      if (start == 0) {
        setState(() {
          _result = onValue;
          print("count : " + _result.length.toString());
        });
      } else {
        setState(() {
          _result.addAll(onValue);
          print("count : " + _result.length.toString());
          isLoading = false;
        });
      }
    });
    setState(() {});
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onLoadHistoryMe(0);
  }

  @override
  Widget build(BuildContext context) {
    return _result.length > 0
        ? _display()
        : Center(
            child: Text(
              '-- ไม่มีข้อมูล --',
              style: TextStyle(
                fontFamily: FontStyles().FontFamily,
                fontSize: 24,
                color: Colors.grey[400],
              ),
            ),
          );
  }

  Widget _display() {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[200]),
            margin: EdgeInsets.only(top: 10, bottom: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'วันที่',
                      style: _topRow,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'เข้างาน',
                      style: _topRow,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'ออกงาน',
                      style: _topRow,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification scrollInfo) {
                        if (!isLoading &&
                            scrollInfo.metrics.pixels ==
                                scrollInfo.metrics.maxScrollExtent) {
                          // start loading data

                          setState(() {
                            start = start + 1;
                            onLoadHistoryMe(start);
                            isLoading = true;
                          });
                        }
                      },
                      child: _list(),
                    ),
                  ),
                  Container(
                    height: isLoading ? 50.0 : 0,
                    color: Colors.white70,
                    child: Center(
                      child: new CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _list() {
    return Scrollbar(
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: _result.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 5),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        _result[index].CREATE_DATE_TH,
                        style: TextStyle(
                            fontFamily: FontStyles().FontFamily, fontSize: 22),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.center, child: _contentStart(index)),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: _contentEnd(index),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _contentStart(int index) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            alert_show_images(context, index, 1);
          },
          child: Container(
            height: 100,
            child: FadeInImage.assetNetwork(
              placeholder: cupertinoActivityIndicatorSmall,
              placeholderScale: 5,
              width: WidhtDevice().widht(context) / 2,
              image: Server.url + _result[index].START_IMAGE,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Container(
          child: Text(
            _result[index].START_TIME,
            style: TextStyle(
              fontFamily: FontStyles().FontFamily,
              fontSize: 18,
              color: (_result[index].START_STATUS == '0'
                  ? Colors.black
                  : Colors.redAccent),
            ),
          ),
        ),
        _result[index].START_STATUS != '0'
            ? Container(
                // child: Text('dd ' + _result[index].START_STATUS),
                child: Text(
                  statusTimeIn[int.parse(_result[index].START_STATUS) - 1],
                  style: TextStyle(
                      fontFamily: FontStyles().FontFamily,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              )
            : Container(
                height: 0,
              )
      ],
    );
  }

  Widget _contentEnd(int index) {
    if (_result[index].END_STATUS != '3') {
      if (_result[index].END_TIME == '') {
        return Container();
      } else {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                alert_show_images(context, index, 2);
              },
              child: Container(
                height: 100,
                child: FadeInImage.assetNetwork(
                  placeholder: cupertinoActivityIndicatorSmall,
                  placeholderScale: 5,
                  width: WidhtDevice().widht(context) / 2,
                  image: Server.url + _result[index].END_IMAGE,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              child: Text(
                _result[index].END_TIME,
                style: TextStyle(
                  fontFamily: FontStyles().FontFamily,
                  fontSize: 18,
                  color: (_result[index].END_STATUS == '0'
                      ? Colors.black
                      : Colors.redAccent),
                ),
              ),
            ),
            _result[index].END_STATUS != '0'
                ? Container(
                    child: Text(
                      statusTimeOut[int.parse(_result[index].END_STATUS) - 1],
                      style: TextStyle(
                          fontFamily: FontStyles().FontFamily,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : Container()
          ],
        );
      }
    } else {
      return Text(
        _result[index].END_NOTE,
        style: TextStyle(
            fontFamily: FontStyles().FontFamily,
            fontSize: 20,
            color: Colors.red[300]),
      );
    }
  }

  alert_show_images(BuildContext context, int index, int _status) async {
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
                _status == 1
                    ? Container(
                        child: FadeInImage.assetNetwork(
                          placeholder: cupertinoActivityIndicatorSmall,
                          placeholderScale: 5,
                          width: WidhtDevice().widht(context) / 2,
                          image: Server.url + _result[index].START_IMAGE,
                          fit: BoxFit.contain,
                        ),
                      )
                    : Container(
                        child: FadeInImage.assetNetwork(
                          placeholder: cupertinoActivityIndicatorSmall,
                          placeholderScale: 5,
                          width: WidhtDevice().widht(context) / 2,
                          image: Server.url + _result[index].END_IMAGE,
                          fit: BoxFit.contain,
                        ),
                      ),
                _status == 1
                    ? Container(
                        child: Container(
                          child: Text(
                            'วันที่ ' +
                                _result[index].CREATE_DATE_TH +
                                ' เวลา ' +
                                _result[index].START_TIME,
                            style: TextStyle(
                              fontFamily: FontStyles().FontFamily,
                              fontSize: 24,
                              color: (_result[index].START_STATUS == '0'
                                  ? Colors.black
                                  : Colors.redAccent),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        child: Container(
                          child: Text(
                            'วันที่ ' +
                                _result[index].CREATE_DATE_TH +
                                ' เวลา ' +
                                _result[index].END_TIME,
                            style: TextStyle(
                              fontFamily: FontStyles().FontFamily,
                              fontSize: 24,
                              color: (_result[index].END_STATUS == '0'
                                  ? Colors.black
                                  : Colors.redAccent),
                            ),
                          ),
                        ),
                      ),
                _status == 1
                    ? _result[index].START_STATUS != '0'
                        ? Container(
                            // child: Text('dd ' + _result[index].START_STATUS),
                            child: Text(
                              statusTimeIn[
                                  int.parse(_result[index].START_STATUS) - 1],
                              style: TextStyle(
                                  fontFamily: FontStyles().FontFamily,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : Container(
                            height: 0,
                          )
                    : _result[index].END_STATUS != '0'
                        ? Container(
                            child: Text(
                              statusTimeOut[
                                  int.parse(_result[index].END_STATUS) - 1],
                              style: TextStyle(
                                  fontFamily: FontStyles().FontFamily,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : Container(),
                _status == 1
                    ? _result[index].START_STATUS != '0'
                        ? Container(
                            child: Text(
                              'เหตุผล : ' + _result[index].START_NOTE,
                              style: TextStyle(
                                fontFamily: FontStyles().FontFamily,
                                fontSize: 20,
                              ),
                            ),
                          )
                        : Container(
                            height: 0,
                          )
                    : _result[index].END_STATUS != '0'
                        ? Container(
                            child: Text(
                              'เหตุผล : ' + _result[index].END_NOTE,
                              style: TextStyle(
                                fontFamily: FontStyles().FontFamily,
                                fontSize: 20,
                              ),
                            ),
                          )
                        : Container(),
                Padding(padding: EdgeInsets.all(10)),
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
