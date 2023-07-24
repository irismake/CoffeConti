import 'package:coffeeconti/features/main_navigation/main_navigation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationProvider extends ChangeNotifier {
  Position? _position;
  bool locationPermissionStatus = false;
  Position? get position => _position;

  Future<Position?> requestLocationPermission(BuildContext context) async {
    // 권한 요청
    PermissionStatus status = await Permission.location.request();
    // 결과 확인
    if (status.isGranted) {
      // 허용된 경우 위치 정보를 가져와서 허용 여부를 반환합니다.
      _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );

      print("goToCurrentPosition $position");

      // 위치 정보를 상태에 업데이트합니다.

      // notifyListeners();

      // MainNavigationScreen으로 이동하고, 현재 페이지는 스택에서 제거합니다.
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: ((context) => MainNavigationScreen()),
        ),
        (route) => false,
      );

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
