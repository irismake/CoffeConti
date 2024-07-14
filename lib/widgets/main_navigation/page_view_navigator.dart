import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../keyword_widget.dart';

class CategoryViewNavigator extends StatefulWidget {
  //final dynamic provider;

  const CategoryViewNavigator({
    super.key,
    //required this.provider,
  });

  @override
  State<CategoryViewNavigator> createState() => _CategoryViewNavigatorState();
}

class _CategoryViewNavigatorState extends State<CategoryViewNavigator>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(
    length: 6,
    vsync: this,
    initialIndex: 0,
    animationDuration: const Duration(milliseconds: 150),
  );
  final List<List<String>> keywords = [
    [
      '공부',
      '뷰',
      '모임',
      '24시간',
      '늦은 마감',
      '이른 오픈',
      '복층',
      '감성',
      '디저트',
      '테이크 아웃',
      '싼가격',
      '펫프렌들리',
      '노키즈존',
    ],
    [
      '심야영업',
      '노 브레이크 타임',
      '가성비',
      '안주맛집',
    ],
    [
      '24시간',
      '품절대란템',
      '테라스',
    ]
  ];

  @override
  void initState() {
    super.initState();
    //initializeData();
  }

  List<String> categoryName = [
    '카페',
    '음식점',
    '편의점',
    '주유소',
    '주차장',
    '병원',
  ];

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            //color: Colors.purple,
            child: Center(
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
                overlayColor: WidgetStatePropertyAll(
                  Colors.blue.shade100,
                ),
                splashBorderRadius: BorderRadius.circular(20),
                indicatorColor: Colors.transparent,
                isScrollable: true,
                onTap: (index) {},
                tabs: List.generate(
                  6,
                  (index) => Tab(text: '${categoryName[index]}'),
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: List.generate(
                6,
                (index) => KeywordWidget(
                  categoryId: index,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
