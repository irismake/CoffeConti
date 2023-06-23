import 'dart:io';

import 'package:coffeeconti/features/main_navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionTab extends StatelessWidget {
  const PermissionTab({super.key});

  @override
  Widget build(BuildContext context) {
    requestLocationPermission(context);
    return Container();
  }
}

Future<bool> requestLocationPermission(BuildContext context) async {
  // 권한 요청
  PermissionStatus status = await Permission.location.request();
  // 결과 확인
  if (!status.isGranted) {
    // 허용이 안된 경우
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
                  child: const Text('설정하기')),
            ],
          );
        });
    return false;
  } else {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: ((context) => MainNavigationScreen()),
        ), (route) {
      return false;
    });
    return true;
  }
}
