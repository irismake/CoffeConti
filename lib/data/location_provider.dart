import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationProvider extends ChangeNotifier {
  Position? _position;
  Position? get position => _position;

  Future<Position?> requestLocationPermission() async {
    _position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
    notifyListeners();
    print('change the position');
    return _position;
  }
}
