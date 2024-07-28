import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/widgets/my_list_widget.dart';
import '../../components/ui/custom_app_bar.dart';

class MyListPage extends StatefulWidget {
  final String groupName;
  const MyListPage({super.key, required this.groupName});

  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage>
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
      appBar: CustomAppBar(appBarTitle: widget.groupName),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
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
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  indicatorColor: Colors.transparent,
                  isScrollable: true,
                  onTap: (index) {},
                  tabs: List.generate(
                    _categoryName.length,
                    (index) => Tab(
                      child: Text('${_categoryName[index]}'),
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
                (index) => MyListWidget(categoryId: _tabController.index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
