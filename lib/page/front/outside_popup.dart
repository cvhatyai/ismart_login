import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ismart_login/page/main.dart';
import 'package:ismart_login/style/font_style.dart';
import 'package:ismart_login/system/clock.dart';
import 'package:ismart_login/system/gps.dart';
import 'package:ismart_login/system/widht_device.dart';
import 'package:location/location.dart';

Completer<GoogleMapController> _controller = Completer();
final currentTime = DateTime.now();

class OutsideDialog extends StatefulWidget {
  final String lat;
  final String long;
  final String mainLat;
  final String mainLng;
  final String time;
  OutsideDialog(
      {Key key,
      @required this.lat,
      this.long,
      this.time,
      this.mainLat,
      this.mainLng})
      : super(key: key);
  @override
  _OutsideDialogState createState() => _OutsideDialogState();
}

class _OutsideDialogState extends State<OutsideDialog> {
  Location _location = new Location();
  double latitude;
  double longitude;
  double myLat = 0.0;
  double myLong = 0.0;
  double setLat = 0.0;
  double setLong = 0.0;
  double totalDistance = 0;
  List _checkboxListTile = ['โปรแกรมระบุตำแหน่งผิดพลาด', 'ทำงานนอกสถานที่'];
  List<bool> _checkbox = [false, false];
  int currentIndex = 0;
  TextEditingController _inputNote = TextEditingController();
  //----
  @override
  void initState() {
    myLocation();
    super.initState();
    setLat = double.parse(widget.lat);
    setLong = double.parse(widget.long);
  }

  myLocation() {
    setState(() {
      myLat = double.parse(widget.lat);
      myLong = double.parse(widget.long);
    });
  }

  mapMark() {
    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(double.parse(widget.lat), double.parse(widget.long)),
      zoom: 18,
    );
    return _kGooglePlex;
  }

  addMarker({String latMain, String logMain}) {
    print(widget.lat + "," + widget.long);
    Set<Marker> markers = {};
    markers.add(Marker(
      markerId: MarkerId('Marker_main'),
      position:
          LatLng(double.parse(widget.mainLat), double.parse(widget.mainLng)),
      infoWindow: InfoWindow(title: 'ตำแหน่งองค์กร'),
      icon: BitmapDescriptor.defaultMarker,
    ));
    markers.add(Marker(
      markerId: MarkerId('Marker_user'),
      position: LatLng(double.parse(widget.lat), double.parse(widget.long)),
      infoWindow: InfoWindow(title: 'ตำแหน่งคุณ'),
      icon: BitmapDescriptor.defaultMarkerWithHue(95),
    ));
    return markers;
  }

// --- Time

  _circle() {
    Set<Circle> circles = Set.from([
      Circle(
          circleId: CircleId('id'),
          center: LatLng(
              double.parse(widget.mainLat), double.parse(widget.mainLng)),
          radius: 30,
          strokeColor: Colors.blue[200].withOpacity(0.5),
          fillColor: Colors.blue[100].withOpacity(0.3),
          strokeWidth: 2),
    ]);
    return circles;
  }

  //----

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      content: SingleChildScrollView(
        child: Container(
          width: WidhtDevice().widht(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      Clock().getTime(),
                      style: TextStyle(
                        fontFamily: FontStyles().FontFamily,
                        height: 1,
                        fontSize: 40,
                        color: Color(0xFF757575),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Text(
                  'คุณไม่ได้อยู่ในพื้นที่',
                  style: TextStyle(
                      fontFamily: FontStyles().FontFamily,
                      fontSize: 22,
                      color: Colors.red),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  'ตำแหน่งที่คุณล็อกอิน',
                  style: TextStyle(
                      fontFamily: FontStyles().FontFamily,
                      fontSize: 20,
                      color: Color(0xFF089AE5)),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 150,
                child: GoogleMap(
                  mapType: MapType.normal,
                  markers: addMarker(
                    latMain: myLat.toString(),
                    logMain: myLong.toString(),
                  ),
                  initialCameraPosition: mapMark(),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  circles: _circle(),
                ),
              ),
              _radioButton(),
              Padding(padding: EdgeInsets.all(10)),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _location.onLocationChanged
                              .listen((LocationData currentLocation) {
                            latitude = currentLocation.latitude.toDouble();
                            longitude = currentLocation.longitude.toDouble();
                          });
                          Map _map = {
                            "time": Clock().getTime(),
                            "lat": latitude.toString(),
                            "long": longitude.toString(),
                            "cause": currentIndex,
                            "causenote": _inputNote.text,
                          };
                          print(_map);
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
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
      ),
    );
  }

  _causeNote() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Text(
              'สาเหตุ',
              style:
                  TextStyle(fontFamily: FontStyles().FontFamily, fontSize: 22),
            ),
            Expanded(
              child: TextFormField(
                controller: _inputNote,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontFamily: FontStyles().FontFamily, fontSize: 22),
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(0), // add padding to adjust icon
                    child: Icon(
                      Icons.edit,
                      size: 22,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  _radioButton() {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 0.0),
        shrinkWrap: true,
        itemCount: _checkboxListTile.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 35.0,
            alignment: Alignment.topCenter,
            child: CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                _checkboxListTile[index],
                style: TextStyle(
                    fontFamily: FontStyles().FontFamily, fontSize: 22),
              ),
              value: _checkbox[index],
              onChanged: (value) {
                setState(
                  () {
                    _checkbox[index] = value;
                    print(_checkbox[index]);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
