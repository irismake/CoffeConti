import 'package:coffeeconti/features/main_navigation/main_navigation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationProvider extends ChangeNotifier {
  Position? _position;
  Position? get position => _position;

  Future<Position?> requestLocationPermission(BuildContext context) async {
    PermissionStatus status = await Permission.location.request();

    if (status.isGranted) {
      _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      notifyListeners();
      print('change the position');
      // Navigator.of(context).pushAndRemoveUntil(
      //   MaterialPageRoute(
      //     builder: ((context) => MainNavigationScreen()),
      //   ),
      //   (route) => false,
      // );

      // 허용됨을 반환합니다.
      return _position;
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // 권한없음을 다이얼로그로 알림
          return AlertDialog(
            content: const Text("권한 설정을 확인해주세요."),
            actions: [
              TextButton(
                onPressed: () {
                  openAppSettings(); // 앱 설정으로 이동
                },
                child: const Text('설정하기'),
              ),
            ],
          );
        },
      );
      return null;
    }
  }
}
