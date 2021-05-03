import 'dart:async';

import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:ismart_login/style/font_style.dart';
import 'package:ismart_login/style/page_style.dart';
import 'package:ismart_login/system/widht_device.dart';
import 'package:place_picker/entities/localization_item.dart';
import 'package:place_picker/place_picker.dart';

Completer<GoogleMapController> _controller = Completer();

class OrganizationCreateScreen extends StatefulWidget {
  final double lat;
  final double lng;

  OrganizationCreateScreen({Key key, @required this.lat, this.lng})
      : super(key: key);

  @override
  _OrganizationCreateScreenState createState() =>
      _OrganizationCreateScreenState();
}

class _OrganizationCreateScreenState extends State<OrganizationCreateScreen> {
  FToast fToast;
  Location _location = new Location();
//-----
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  mapMark() {
    double _lat = widget.lat;
    double _lng = widget.lng;
    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(_lat, _lng),
      zoom: 18,
    );
    return _kGooglePlex;
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
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppBar(
                    centerTitle: true,
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 26,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    title: Text(
                      'สร้างทีม/องค์กรใหม่',
                      style: TextStyle(
                          fontFamily: FontStyles().FontFamily,
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),
                    backgroundColor: Colors.white.withOpacity(0),
                    elevation: 0,
                  ),
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 20, bottom: 20),
                      width: WidhtDevice().widht(context),
                      decoration: StylePage().boxWhite,
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              // controller: _inputUsername,
                              // focusNode: _focusUsername,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  fontFamily: FontStyles().FontFamily,
                                  fontSize: 24),
                              decoration: InputDecoration(
                                hintText: 'ชื่อทีม/องค์กร',
                                hintStyle: TextStyle(
                                    fontFamily: FontStyles().FontFamily,
                                    fontSize: 24),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(
                                      0), // add padding to adjust icon
                                  child: Icon(
                                    Icons.work,
                                    size: 26,
                                  ),
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(10)),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'ตำแหน่งที่ตั้งองค์กร',
                                style: TextStyle(
                                    fontFamily: FontStyles().FontFamily,
                                    color: Colors.blue,
                                    fontSize: 24),
                              ),
                            ),
                            Container(
                              height: 300,
                              child: PlacePicker(
                                "AIzaSyC_toS4JYdMubnqCRVg7mbJk4t6nvkRUlY",
                              ),
                            ),
                            // Container(
                            //   height: 200,
                            //   child: GoogleMap(
                            //     mapType: MapType.normal,
                            //     initialCameraPosition: mapMark(),
                            //     onMapCreated: (GoogleMapController controller) {
                            //       _controller.complete(controller);
                            //     },
                            //   ),
                            // )
                          ],
                        ),
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

  _showToast() async {
    // this will be our toast UI
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.black,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.copy,
            color: Colors.white,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            'คัดลอกแล้ว',
            style: TextStyle(
                fontFamily: FontStyles().FontFamily,
                fontSize: 22,
                color: Colors.white),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 5),
    );
  }
}
