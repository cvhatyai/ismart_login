import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ismart_login/style/font_style.dart';
import 'package:ismart_login/system/gps.dart';
import 'package:ismart_login/system/widht_device.dart';
import 'package:location/location.dart';

Completer<GoogleMapController> _controller = Completer();

mapMark({String lat, String log}) {
  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(double.parse(lat), double.parse(log)),
    zoom: 14.4746,
  );
  return _kGooglePlex;
}

addMarker({String latMain, String logMain}) {
  location.onLocationChanged.listen((LocationData currentLocation) {
    latitude = currentLocation.latitude.toDouble();
    longitude = currentLocation.longitude.toDouble();
  });
  print(latitude.toString() + "," + longitude.toString());
  Set<Marker> markers = {};
  markers.add(Marker(
    markerId: MarkerId('Marker_main'),
    position: LatLng(double.parse(latMain), double.parse(logMain)),
    icon: BitmapDescriptor.defaultMarker,
  ));
  markers.add(Marker(
    markerId: MarkerId('Marker_user'),
    position: LatLng(
        double.parse(latitude.toString()), double.parse(longitude.toString())),
    icon: BitmapDescriptor.defaultMarker,
  ));

  return markers;
}

alert_insite(
    {BuildContext context, String pathImage, String lat, String long}) async {
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
                alignment: Alignment.center,
                height: 100,
                child: GoogleMap(
                  mapType: MapType.normal,
                  markers: addMarker(
                    latMain: lat,
                    logMain: long,
                  ),
                  initialCameraPosition: mapMark(lat: lat, log: long),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
              Container(
                height: 150,
                child: Image.file(
                  File(pathImage),
                  fit: BoxFit.fitHeight,
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
                            color: Colors.red[100],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                            ),
                          ),
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            'ตกลง',
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
