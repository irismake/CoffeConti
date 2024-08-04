import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/ui/category_tab_bar.dart';
import '../../components/widgets/select_keyword_widget.dart';

class SelectCategoryPage extends StatelessWidget {
  const SelectCategoryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0.h),
        child: CategoryTabBar(
          tabBarViewWidget: SelectKeywordWidget(),
        ),
      ),
    );
  }
}
