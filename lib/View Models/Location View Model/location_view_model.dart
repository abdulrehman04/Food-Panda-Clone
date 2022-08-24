import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LocationViewModel extends GetxController {
  late Position currentLocation;

  Future enableLocation() async {
    var enabled = await Geolocator.isLocationServiceEnabled();
    if (!enabled) {
      return Future.error('Location services are disabled.');
    } else {
      return true;
    }
  }

  Future getPermission() async {
    var permission = await Geolocator.checkPermission();
    print(permission);
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      } else if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        return true;
      }
    } else if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return true;
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
  }

  Future getCurrentLocation() async {
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return location;
  }

  Future startCurrentLocationStream() async {
    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream().listen((Position? position) {
      if (position != null) {
        currentLocation = position;
        print("${currentLocation.latitude}, ${currentLocation.longitude}");
      }
    });
  }
}
