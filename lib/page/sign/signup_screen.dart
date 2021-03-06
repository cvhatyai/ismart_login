import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ismart_login/page/sign/future/member_future.dart';
import 'package:ismart_login/page/sign/model/memberlist.dart';
import 'package:ismart_login/page/sign/model/otplist.dart';
import 'package:ismart_login/page/sign/otp_screen.dart';
import 'package:ismart_login/style/page_style.dart';
import 'package:ismart_login/style/font_style.dart';
import 'package:ismart_login/system/widht_device.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  //Setup
  PickedFile _imageFile;
  dynamic _pickImageError;
  //----
  TextEditingController _inputName = TextEditingController();
  TextEditingController _inputLastname = TextEditingController();
  TextEditingController _inputPhone = TextEditingController();
  TextEditingController _inputPassword = TextEditingController();
  TextEditingController _inputRePassword = TextEditingController();
  //--- Map get Value
  _postDataInput() {
    Map _map = {
      "NAME": _inputName.text,
      "LASTNAME": _inputLastname.text,
      "PHONE": _inputPhone.text,
      "PASSWORD": _inputPassword.text,
      "REPASSWORD": _inputRePassword.text,
    };
    // onLoadInsertMember(_map);
    return _map;
  }

  //--API
  List<ItemsOTPList> _result = [];
  Future<bool> onLoadInsertMember(Map map) async {
    await new MemberFuture().apiPostOtp(map).then((onValue) {
      _result = onValue;
      print(_result[0].MSG);
      print(onValue.length);
    });
    setState(() {});
    return true;
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
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'iSmartLogin',
                          style: TextStyle(
                              fontFamily: FontStyles().FontFamily,
                              fontSize: 46,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: FaIcon(
                            FontAwesomeIcons.times,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 5, right: 5, top: 10, bottom: 20),
                      width: WidhtDevice().widht(context),
                      decoration: StylePage().boxWhite,
                      child: Column(
                        children: [
                          // Container(
                          //   margin: EdgeInsets.only(top: 15),
                          //   alignment: Alignment.center,
                          //   width: 100,
                          //   height: 100,
                          //   decoration: new BoxDecoration(
                          //     color: Color(0xFF18C0FF),
                          //     shape: BoxShape.circle,
                          //   ),
                          //   child: Icon(
                          //     Icons.person,
                          //     color: Colors.white,
                          //     size: 75,
                          //   ),
                          // ),
                          // Text(
                          //   '???????????????????????????',
                          //   style: TextStyle(
                          //       fontFamily: FontStyles().FontFamily, fontSize: 46),
                          // ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 40, left: 20, right: 20),
                            child: formlogin(),
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
      ),
    );
  }

  Widget formlogin() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              _handleClickFiles();
            },
            child: Container(
              child: Center(
                child: Container(
                  child: ClipOval(
                    child: Container(
                      width: 150,
                      height: 150,
                      color: Color(0xFFA6D6F2),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Center(
                                child: _imageFile == null
                                    ? Icon(
                                        Icons.person,
                                        size: 140,
                                        color: Colors.white,
                                      )
                                    : Image.file(
                                        File(_imageFile.path),
                                        fit: BoxFit.cover,
                                        width: 300.0,
                                        height: 300.0,
                                      ),
                              ),
                            ),
                          ),
                          Container(
                            height: 33.0,
                            width: double.infinity,
                            color: Color(0xFF7B7B7B),
                            child: Center(
                              child: Container(
                                child: Text('?????????????????????????????????',
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontFamily: FontStyles().FontFamily),
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  child: TextFormField(
                    controller: _inputName,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontFamily: FontStyles().FontFamily,
                      fontSize: 24,
                    ),
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: '????????????',
                      hintStyle: TextStyle(
                        fontFamily: FontStyles().FontThaiSans,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Expanded(
                child: SizedBox(
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _inputLastname,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontFamily: FontStyles().FontFamily,
                      fontSize: 24,
                    ),
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: '?????????????????????',
                        hintStyle: TextStyle(
                          fontFamily: FontStyles().FontThaiSans,
                          fontSize: 24,
                        )),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          SizedBox(
            child: TextFormField(
              controller: _inputPhone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              keyboardType: TextInputType.phone,
              style: TextStyle(
                fontFamily: FontStyles().FontFamily,
                fontSize: 24,
              ),
              decoration: InputDecoration(
                alignLabelWithHint: true,
                hintText: '???????????????????????????????????????',
                hintStyle: TextStyle(
                    fontFamily: FontStyles().FontThaiSans, fontSize: 24),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          SizedBox(
            child: TextFormField(
              controller: _inputPassword,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              obscureText: true,
              style: TextStyle(
                fontFamily: FontStyles().FontFamily,
                fontSize: 24,
              ),
              decoration: InputDecoration(
                alignLabelWithHint: true,
                hintText: '????????????????????????',
                hintStyle: TextStyle(
                    fontFamily: FontStyles().FontThaiSans, fontSize: 24),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          SizedBox(
            child: TextFormField(
              controller: _inputRePassword,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                } else {
                  if (_inputPassword.text != '' &&
                      _inputPassword.text != value) {
                    return '???????????????????????????????????????????????????????????????';
                  }
                }
                return null;
              },
              obscureText: true,
              style: TextStyle(
                fontFamily: FontStyles().FontFamily,
                fontSize: 24,
              ),
              decoration: InputDecoration(
                alignLabelWithHint: true,
                hintText: '??????????????????????????????????????????',
                hintStyle: TextStyle(
                    fontFamily: FontStyles().FontThaiSans, fontSize: 24),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    print('??????????????????');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    padding: EdgeInsets.only(left: 25, right: 25),
                    decoration: BoxDecoration(
                      color: Color(0xFFC8C8C8),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      '??????????????????',
                      style: TextStyle(
                          fontFamily: FontStyles().FontFamily,
                          color: Colors.black,
                          fontSize: 26),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      print('???????????????');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(
                            map: _postDataInput(),
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    padding: EdgeInsets.only(left: 25, right: 25),
                    decoration: BoxDecoration(
                      color: Color(0xFF079CFD),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      '???????????????',
                      style: TextStyle(
                          fontFamily: FontStyles().FontFamily,
                          color: Colors.white,
                          fontSize: 26),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _handleClickFiles() async {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('??????????????????????????????',
              textScaleFactor: 1.0,
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text(
                '??????????????????',
                textScaleFactor: 1.0,
              ),
              onPressed: () {
                // _openFileImagesExplorer();
                _imgFromGallery();
                Navigator.pop(context);
              },
            ),
            CupertinoActionSheetAction(
              child: Text(
                '???????????????',
                textScaleFactor: 1.0,
              ),
              onPressed: () {
                // _openCameraExplorer(ImageSource.camera, context: context);
                _imgFromCamera();
                Navigator.pop(context);
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            child: Text('??????????????????',
                textScaleFactor: 1.0, style: TextStyle(color: Colors.red)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  _imgFromCamera() async {
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

  _imgFromGallery() async {
    try {
      final pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery,
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
