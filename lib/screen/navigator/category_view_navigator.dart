import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/selection_keyword_widget.dart';

class CategoryViewNavigator extends StatefulWidget {
  final dynamic provider;
  const CategoryViewNavigator({
    super.key,
    required this.provider,
  });

  @override
  State<CategoryViewNavigator> createState() => _CategoryViewNavigatorState();
}

class _CategoryViewNavigatorState extends State<CategoryViewNavigator>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 6,
      vsync: this,
      initialIndex: widget.provider.selectedCategoryId ?? 0,
      animationDuration: const Duration(milliseconds: 150),
    );
  }

  void categoryTapListener(int index) {
    widget.provider.saveTempCategoryId = index;
    widget.provider.fetchCategoryData();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: TabBar(
                controller: tabController,
                tabAlignment: TabAlignment.start,
                dividerHeight: 0,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                unselectedLabelColor: Colors.grey,
                unselectedLabelStyle: TextStyle(
                  fontSize: 16.sp,
                ),
                labelColor: Colors.black,
                labelStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
                indicatorColor: Colors.transparent,
                isScrollable: true,
                onTap: (index) {
                  categoryTapListener(index);
                },
                tabs: List.generate(
                  6,
                  (index) => Tab(text: widget.provider.categoryNames[index]),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: List.generate(
                  6,
                  (index) => SelectionKeywordWidget(
                    keywordDatas: widget.provider.showKeywordDatas,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
