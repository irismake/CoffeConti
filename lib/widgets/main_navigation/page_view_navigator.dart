import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/button/category_tab_bar.dart';

import '../keyword_widget.dart';

class CategoryViewNavigator extends StatefulWidget {
  //final dynamic provider;

  final int initialPage;

  const CategoryViewNavigator({
    super.key,
    //required this.provider,

    required this.initialPage,
  });

  @override
  State<CategoryViewNavigator> createState() => _CategoryViewNavigatorState();
}

class _CategoryViewNavigatorState extends State<CategoryViewNavigator> {
  late PageController _pageController;

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
    _pageController =
        PageController(initialPage: widget.initialPage, viewportFraction: 1);
  }

  int currentPageNum = 0;
  List<String> categoryName = ['카페', '음식점', '편의점', '주유소', '주차장'];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void categoryOntap(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 150),
      curve: Curves.easeInOut,
    );
    setState(() {
      currentPageNum = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //int currentPageNum = widget.initialPage;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CategoryTabBar(
                  pageState: currentPageNum == 0,
                  tabName: categoryName[0],
                  onTap: () {
                    categoryOntap(0);
                  },
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                CategoryTabBar(
                  pageState: currentPageNum == 1,
                  tabName: categoryName[1],
                  onTap: () {
                    categoryOntap(1);
                  },
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                CategoryTabBar(
                  pageState: currentPageNum == 2,
                  tabName: categoryName[2],
                  onTap: () {
                    categoryOntap(2);
                  },
                ),
              ],
            ),
            SizedBox(
              width: 18.0.w,
            ),
            Expanded(
              child: PageView(
                scrollDirection: Axis.vertical,
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    currentPageNum = page;
                  });
                },
                children: List.generate(
                  3,
                  (index) {
                    return KeywordWidget(
                      categoryId: index,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
