import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ismart_login/style/develop_blank.dart';
import 'package:ismart_login/style/font_style.dart';
import 'package:ismart_login/style/page_style.dart';
import 'package:ismart_login/system/widht_device.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //Setup
  PickedFile _imageFile;
  dynamic _pickImageError;

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
                  'แข้ไขข้อมูลส่วนตัว',
                  style: TextStyle(
                      fontFamily: FontStyles().FontFamily,
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.white.withOpacity(0),
                elevation: 0,
              ),
              SingleChildScrollView(
                child: Container(
                  padding:
                      EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 20),
                  width: WidhtDevice().widht(context),
                  decoration: StylePage().boxWhite,
                  child: Column(
                    children: [
                      DevelopBlank.show(),
                      // GestureDetector(
                      //   onTap: () {
                      //     _handleClickFiles();
                      //   },
                      //   child: Container(
                      //     margin: EdgeInsets.only(top: 10),
                      //     child: Center(
                      //       child: Container(
                      //         child: ClipOval(
                      //           child: Container(
                      //             width: 150,
                      //             height: 150,
                      //             color: Color(0xFFA6D6F2),
                      //             child: Column(
                      //               children: <Widget>[
                      //                 Expanded(
                      //                   child: Container(
                      //                     child: Center(
                      //                       child: _imageFile == null
                      //                           ? Icon(
                      //                               Icons.person,
                      //                               size: 140,
                      //                               color: Colors.white,
                      //                             )
                      //                           : Image.file(
                      //                               File(_imageFile.path),
                      //                               fit: BoxFit.cover,
                      //                               width: 300.0,
                      //                               height: 300.0,
                      //                             ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 Container(
                      //                   height: 33.0,
                      //                   width: double.infinity,
                      //                   color: Color(0xFF7B7B7B),
                      //                   child: Center(
                      //                     child: Container(
                      //                       child: Text('เพิ่มรูปภาพ',
                      //                           textScaleFactor: 1.0,
                      //                           style: TextStyle(
                      //                               color: Colors.white,
                      //                               fontSize: 18.0,
                      //                               fontFamily: FontStyles()
                      //                                   .FontFamily),
                      //                           textAlign: TextAlign.center),
                      //                     ),
                      //                   ),
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Padding(padding: EdgeInsets.all(10)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleClickFiles() async {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('อัพโหลดรูป',
              textScaleFactor: 1.0,
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text(
                'รูปภาพ',
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
                'กล้อง',
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
            child: Text('ยกเลิก',
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
