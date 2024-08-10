import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../components/popup/app_setting_popup.dart';
import '../../components/popup/error_message_popup.dart';

class LocationProvider extends ChangeNotifier {
  LatLng? _position;
  LatLng? get position => _position;

  Future<void> getInitialPosition(BuildContext context) async {
    if (_position != null) {
      notifyListeners();
      return; // 이미 위치를 가져왔다면 캐시된 값을 반환
    }

    PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      try {
        Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
        );
        _position = LatLng(currentPosition.latitude, currentPosition.longitude);
      } catch (e) {
        print('Dont get currentPosition');
        _errorPopup(context);
      }
      notifyListeners();
      print('change the position');
    } else {
      _showPermissionPopup(context);
    }
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
