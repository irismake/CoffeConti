import 'package:coffeeconti/constants/gaps.dart';
import 'package:flutter/material.dart';

class ShowErrorMessage extends StatelessWidget {
  const ShowErrorMessage(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Container(
        width: 180, // Set the desired width
        height: 80, // Set the desired height
        child: const Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Center the text vertically
          children: const [
            Text(
              "Error",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Gaps.v16,
            Text(
              "일시적인 오류가 발생하였습니다.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            Text(
              "잠시 후 다시 이용해주세요.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ), // Center the text horizontally // Center the text horizontally
          ],
        ),
      ),
    );
  }
}
