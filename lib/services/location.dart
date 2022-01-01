import 'package:location/location.dart';

class MyLocation {
  double latitude;
  double longitude;
  Future<void> getLocation() async {
    Location location = new Location();
    bool errorHappened = false;

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      print('Requesting Service');
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        print('service not enabled');
        errorHappened = true;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      print('Permission Denied');
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print('Permission Denied after Requesting');
        errorHappened = true;
      }
    }
    if (!errorHappened) {
      _locationData = await location.getLocation();
      latitude = _locationData.latitude;
      longitude = _locationData.longitude;
    } else {
      latitude = -1;
      longitude = -1;
    }
    /*
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
    */
  }
}
