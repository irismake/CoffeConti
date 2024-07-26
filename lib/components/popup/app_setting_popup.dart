import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../constants/gaps.dart';
import '../constants/sizes.dart';

class ShowAppSettingMessage extends StatelessWidget {
  const ShowAppSettingMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding:
          EdgeInsets.fromLTRB(Sizes.size20, Sizes.size20, Sizes.size20, 0.0),
      actionsPadding: EdgeInsets.all(Sizes.size10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "위치 서비스 사용",
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          Gaps.v10,
          Text(
            "위치 서비스를 사용할 수 없습니다.\n기기의 '설정 > coffeeconti > 위치' 에서 위치 서비스를 켜주세요.",
            style: TextStyle(
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.size20,
          ),
          child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                  Theme.of(context).primaryColor), // Change the text color
              textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: Sizes.size16)), // Change the text style
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              openAppSettings(); // 앱 설정으로 이동
            },
            child: const Text('설정으로 이동'),
          ),
        ),
      ],
    );
  }
}
