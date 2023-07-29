import 'package:coffeeconti/app_setting_popup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationProvider extends ChangeNotifier {
  Position? _position;
  Position? get position => _position;

  Future<Position?> getCurrentPosition(BuildContext context) async {
    PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      try {
        _position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
        );
      } catch (e) {
        print('Dont get currentPosition');
      }
      notifyListeners();
      print('change the position');
    } else {
      _showPermissionPopup(context);
    }
    return _position;
  }
}

void _showPermissionPopup(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return GoToOpenAppSettings(); // Show the MyPopup widget as the content of the dialog
    },
  );
}

void _errorPopup(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Container(); // Show the MyPopup widget as the content of the dialog
    },
  );
}
