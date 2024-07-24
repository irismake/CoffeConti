import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bookmark_list.dart';

class BookmarkListWidget extends StatefulWidget {
  final String groupName;
  const BookmarkListWidget({super.key, required this.groupName});

  @override
  _BookmarkListWidgetState createState() => _BookmarkListWidgetState();
}

class _BookmarkListWidgetState extends State<BookmarkListWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<String> _categoryName = ['카페', '음식점', '주차장'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _categoryName.length,
      vsync: this,
      initialIndex: 0,
      animationDuration: const Duration(milliseconds: 150),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64.0.h,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); //뒤로가기
          },
          icon: Image.asset(
            'assets/icons/icon_go_back.png',
            height: 20.h,
          ),
        ),
        title: Text(
          widget.groupName,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18.0.sp,
            height: 1.56,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0.0.h,
              horizontal: 16.0.w,
            ),
            child: Container(
              //color: Colors.amber,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  controller: _tabController,
                  tabAlignment: TabAlignment.start,
                  dividerHeight: 0,
                  unselectedLabelColor: Colors.grey,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 14.sp,
                  ),
                  labelColor: Colors.black,
                  labelStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  indicatorColor: Colors.transparent,
                  isScrollable: true,
                  onTap: (index) {},
                  tabs: List.generate(
                    _categoryName.length,
                    (index) => Tab(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 6.0.h, horizontal: 16.0.w),
                        decoration: BoxDecoration(
                          color: _tabController.index == index
                              ? Theme.of(context).primaryColor
                              : Colors.transparent, // 선택된 탭의 배경색
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text('${_categoryName[index]}'),
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
              children: List.generate(
                _categoryName.length,
                (index) => BookmarkList(categoryId: _tabController.index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
