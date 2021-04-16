import 'package:location/location.dart';

Location location = new Location();
bool _serviceEnabled;
PermissionStatus _permissionGranted;
double latitude; // Latitude, in degrees
double longitude; // Longitude, in degrees

class LocationService {
  static checkService() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    print("Check Service Location : " + _serviceEnabled.toString());
  }

  getLocation() {
    String a = '';
    location.onLocationChanged.listen((LocationData currentLocation) {
      latitude = currentLocation.latitude.toDouble();
      longitude = currentLocation.longitude.toDouble();
      a = "" + latitude.toString() + "," + longitude.toString();
      print(a);
      return a;
    });
  }
}
