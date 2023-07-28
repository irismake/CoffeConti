import 'package:coffeeconti/features/main_navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class GoToOpenAppSettings extends StatelessWidget {
  const GoToOpenAppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    //goToOpenAppSettings(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Show the dialog after the widget is built
      showMyAlertDialog(context);
    });

    return MainNavigationScreen(); // Placeholder container, you can return any other widget here
  }

  void showMyAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
              "현재 내 위치와 가까운 가게를 찾기 위해 위치 권한이 필요합니다. 설정에서 위치 권한을 허용시켜주세요."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                openAppSettings(); // 앱 설정으로 이동
              },
              child: const Text('설정하기'),
            ),
          ],
        );
      },
    );
  }
}
