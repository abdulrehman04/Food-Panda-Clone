import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/state_manager.dart';
import 'package:reasa/widgets.dart';

class LocationService extends GetxController {
  late Rx<Position> currentLocation;
  bool initialisedLocation = false;
  Completer<bool> serviceStarted = Completer();

  // LocationService() {
  // enableLocation().then((value) {
  //   if (value) {
  //     getPermission().then((value) {
  //       if (value) {
  //         startCurrentLocationStream();
  //       }
  //     }).onError((error, stackTrace) {
  //       errorSnack(error);
  //     });
  //   }
  // }).onError((error, stackTrace) {
  //   errorSnack(error);
  // });
  // }

  Future<bool> testDelay() async {
    await Future.delayed(const Duration(seconds: 4));
    return Future.value(true);
  }

  Future<bool> initLocationService() async {
    var location = await enableLocation().onError((error, stackTrace) {
      errorSnack(error);
    });
    if (location) {
      var permission = await getPermission().onError((error, stackTrace) {
        errorSnack(error);
      });
      if (permission) {
        startCurrentLocationStream();
        await Future.delayed(const Duration(seconds: 2));
        serviceStarted.complete(true);
        return serviceStarted.future;
      } else {
        serviceStarted.complete(false);
        return serviceStarted.future;
      }
    } else {
      serviceStarted.complete(false);
      return serviceStarted.future;
    }
  }

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

  Future<Rx<Position>> getCurrentLocation() async {
    var location = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    initialisedLocation = true;
    return Rx(location);
  }

  startCurrentLocationStream() async {
    Stream<Position> data = Geolocator.getPositionStream();
    data.listen((position) {
      if (position != null) {
        print("${position.latitude}, ${position.longitude}");
        if (initialisedLocation == false) {
          currentLocation = Rx(position);
          initialisedLocation = true;
        } else {
          currentLocation.value = position;
        }
      }
    });
  }
}
