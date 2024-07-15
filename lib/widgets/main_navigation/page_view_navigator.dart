import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../data/models/keyword_model.dart';
import '../../data/provider/keyword_provider.dart';
import '../keyword_widget.dart';

class CategoryViewNavigator extends StatefulWidget {
  const CategoryViewNavigator({
    super.key,
  });

  @override
  State<CategoryViewNavigator> createState() => _CategoryViewNavigatorState();
}

class _CategoryViewNavigatorState extends State<CategoryViewNavigator>
    with SingleTickerProviderStateMixin {
  List<KeywordData> keywordLists = [];

  late TabController tabController = TabController(
    length: 6,
    vsync: this,
    initialIndex: 0,
    animationDuration: const Duration(milliseconds: 150),
  );

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final keywordProvider =
          Provider.of<KeywordsProvider>(context, listen: false);
      keywordProvider.fetchAllData().then((_) {
        keywordProvider.selectedCategory = tabController.index;
        keywordProvider.getKeywords();
        keywordLists = keywordProvider.keywordDatas;
      });
    });
  }

  void categoryTapListener(int index) {
    final keywordProvider =
        Provider.of<KeywordsProvider>(context, listen: false);
    keywordProvider.selectedCategory = index;
    keywordProvider.getKeywords();
    keywordLists = keywordProvider.keywordDatas;
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
    return Consumer<KeywordsProvider>(
      builder: (context, provider, child) {
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
                    indicatorColor: Colors.transparent,
                    isScrollable: true,
                    onTap: (index) {
                      categoryTapListener(index);
                    },
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
                    (index) =>
                        KeywordWidget(keywordDatas: provider.keywordDatas),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
