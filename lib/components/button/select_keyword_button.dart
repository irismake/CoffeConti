import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/provider/keyword_provider.dart';

class SelectKeywordButton extends StatelessWidget {
  final String keywordName;
  final int keywordId;

  const SelectKeywordButton({
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
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            decoration: BoxDecoration(
              color: provider.selectedKeywordIds.contains(keywordId)
                  ? Color(0xFF3D3332)
                  : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black.withOpacity(0.1)),
            ),
            child: Text(
              keywordName,
              style: TextStyle(
                color: provider.selectedKeywordIds.contains(keywordId)
                    ? Theme.of(context).primaryColor
                    : Color(0xff868E96),
                fontWeight: provider.selectedKeywordIds.contains(keywordId)
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
