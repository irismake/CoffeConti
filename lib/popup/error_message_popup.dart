import 'package:flutter/material.dart';

class ShowErrorMessage extends StatelessWidget {
  const ShowErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text("일시적인 오류가 발생하였습니다. 앱을 껐다가 다시 사용해주세요."),
    );
  }
}
