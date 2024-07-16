import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../components/button/keyword_button.dart';
import '../data/provider/keyword_provider.dart';
import '../popup/show_category_sheet.dart';

class KeywordWidget extends StatelessWidget {
  const KeywordWidget({super.key});

  void _tapCategory(BuildContext context, int index) {
    if (index == 0) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return ShowCategorySheet();
        },
      );
    } else {
      // 클릭시 바로 데이터 가져오기
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<KeywordsProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0.h),
          child: SizedBox(
            height: 40.0.h,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: provider.selectedKeywordDatas.length + 1,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => KeywordButton(
                index: index,
                keywordId: index == 0
                    ? -1
                    : provider.selectedKeywordDatas[index - 1].id,
                name: provider.selectedCategoryId == null
                    ? '카테고리'
                    : index == 0
                        ? '${provider.categoryNames[provider.selectedCategoryId!]}'
                        : '${provider.selectedKeywordDatas[index - 1].name}',
                onTap: () {
                  _tapCategory(context, index);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
