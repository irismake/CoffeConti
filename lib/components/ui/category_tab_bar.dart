import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../data/provider/keyword_provider.dart';

class CategoryTabBar extends StatefulWidget {
  final Widget tabBarViewWidget;

  CategoryTabBar({
    super.key,
    required this.tabBarViewWidget,
  });

  @override
  State<CategoryTabBar> createState() => _CategoryTabBarState();
}

class _CategoryTabBarState extends State<CategoryTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> _categoryNames = [
    '카페',
    '음식점',
    '편의점',
    '영화관',
    '주차장',
    '병원',
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 6,
      vsync: this,
      initialIndex: Provider.of<KeywordsProvider>(context, listen: false)
              .selectedCategoryId ??
          0,
      animationDuration: const Duration(milliseconds: 100),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    print('disposeee');
    super.dispose();
  }

  void categoryTapListener(int index) {
    Provider.of<KeywordsProvider>(context, listen: false).saveTempCategoryId =
        index;
    Provider.of<KeywordsProvider>(context, listen: false).fetchCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    List<String> _categoryImages = [
      'cafe',
      'restaurant',
      'convenience_store',
      'movie',
      'parking',
      'hospital'
    ];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 18.0.w,
          ),
          child: Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: _tabController,
                tabAlignment: TabAlignment.start,
                dividerHeight: 0,
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.43,
                ),
                labelColor: Colors.black,
                labelStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.43,
                ),
                labelPadding: EdgeInsets.symmetric(
                  horizontal: 4.0,
                ),
                indicatorColor: Colors.transparent,
                isScrollable: true,
                onTap: (index) {
                  categoryTapListener(index);
                },
                tabs: List.generate(
                  _categoryNames.length,
                  (index) => Container(
                    decoration: BoxDecoration(
                      color: index == _tabController.index
                          ? Colors.white
                          : Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: index == _tabController.index
                            ? Color(0xFF343A40)
                            : Colors.transparent,
                        width: 0.7,
                      ),
                      boxShadow: index == _tabController.index
                          ? [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(0, 0),
                              )
                            ]
                          : [],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 7.0,
                      ),
                      child: Tab(
                        height: 20,
                        child: Row(
                          children: [
                            if (index == _tabController.index)
                              Container(
                                height: 18,
                                width: 18,
                                child: Image.asset(
                                  'assets/images/image_thumb_${_categoryImages[index]}.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            SizedBox(
                              width: 2,
                            ),
                            Text('${_categoryNames[index]}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(
              _categoryNames.length,
              (index) => widget.tabBarViewWidget,
            ),
          ),
        ),
      ],
    );
  }
}
