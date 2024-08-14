import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../components/popup/app_setting_popup.dart';
import '../../components/popup/error_message_popup.dart';

class LocationProvider extends ChangeNotifier {
  LatLng? _initialPosition;
  LatLng? get initialPosition => _initialPosition;

  LatLng? _searchPosition;
  LatLng? get searchPosition => _searchPosition;

  Future<void> getInitialPosition(BuildContext context) async {
    if (_initialPosition != null) {
      return;
    }

    PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      try {
        Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
        );
        _initialPosition =
            LatLng(currentPosition.latitude, currentPosition.longitude);
      } catch (e) {
        print('Dont get currentPosition');
        _errorPopup(context);
      }
      notifyListeners();
      print('getInitialPosition');
    } else {
      _showPermissionPopup(context);
    }
  }

  set getSearchPosition(LatLng searchPosition) {
    _searchPosition = searchPosition;
  }

  void _showPermissionPopup(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ShowAppSettingMessage();
      },
    );
  }

  void _errorPopup(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return ShowErrorMessage(context);
      },
    );
  }
}
