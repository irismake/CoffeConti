import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../components/popup/app_setting_popup.dart';
import '../../components/popup/error_message_popup.dart';

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
        _errorPopup(context);
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
      return ShowAppSettingMessage(); // Show the MyPopup widget as the content of the dialog
    },
  );
}

void _errorPopup(BuildContext context) {
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return ShowErrorMessage(
          context); // Show the MyPopup widget as the content of the dialog
    },
  );
}
