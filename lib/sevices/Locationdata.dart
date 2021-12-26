import 'package:geolocator/geolocator.dart';

class locationData {
  dynamic lat;
  dynamic lon;
  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    final loc = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    lat = loc.latitude;
    lon = loc.longitude;
    return loc;
  }
}
