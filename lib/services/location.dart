import 'package:geolocator/geolocator.dart';

class Location {
  Location({this.latitude, this.longitude});

  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    // 'await' = wait for this location fetching to finish before assigning a value to 'position'
    // without 'await' we could still have a position, but it would be a Future<Position> - a representation of a Position object
    // await says 'wait until it's finished before assigning the value to it'
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
