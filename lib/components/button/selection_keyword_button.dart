import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../data/provider/keyword_provider.dart';

class SelectionKeywordButton extends StatelessWidget {
  final String keywordName;
  final int keywordId;

  const SelectionKeywordButton({
    Key? key,
    required this.keywordName,
    required this.keywordId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<KeywordsProvider>(
      builder: (context, provider, child) {
        return GestureDetector(
          onTap: () {
            provider.changeKeywordState(keywordId);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.symmetric(
              vertical: 10.0.h,
              horizontal: 20.0.w,
            ),
            decoration: BoxDecoration(
              color: provider.getKeywordState(keywordId)
                  ? Theme.of(context).primaryColor
                  : Colors.white,
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: Colors.black.withOpacity(0.1)),
            ),
            child: Text(
              keywordName,
              style: TextStyle(
                color: provider.getKeywordState(keywordId)
                    ? Colors.black
                    : Color(0xff868E96),
                fontWeight: provider.getKeywordState(keywordId)
                    ? FontWeight.w700
                    : FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
  }
}
