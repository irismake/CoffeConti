import 'package:coffeeconti/screen/tabs/edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../tabs/bookmark_page.dart';
import '../tabs/user_page.dart';
import '../tabs/map_tab/map.dart';
import '../../components/button/nav_tab.dart';

class MainViewNavigator extends StatefulWidget {
  MainViewNavigator({super.key});

  @override
  State<MainViewNavigator> createState() => _MainViewNavigatorState();
}

class _MainViewNavigatorState extends State<MainViewNavigator> {
  int selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    CafeMap(),
    EditPage(),
    BookmarkPage(),
    UserPage(),
  ];

  void _onTap(int index) {
    setState(() {
      selectedIndex = index;
      print(selectedIndex);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _widgetOptions.elementAt(selectedIndex),
        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.only(
            top: 14.0.h,
            bottom: 10.0.h,
          ),
          height: 50.0.h,
          color: Colors.black,
          child: TabBar(
            dividerHeight: 0,
            indicatorColor: Colors.transparent,
            isScrollable: false,
            onTap: (index) {
              _onTap(index);
            },
            tabs: <Widget>[
              NavTabButton(
                isSelected: selectedIndex == 0,
                iconName: 'tab_home',
              ),
              NavTabButton(
                isSelected: selectedIndex == 1,
                iconName: 'tab_add',
              ),
              NavTabButton(
                isSelected: selectedIndex == 2,
                iconName: 'tab_bookmark',
              ),
              NavTabButton(
                isSelected: selectedIndex == 3,
                iconName: 'tab_user',
              )
            ],
          ),
        ),
      ),
    );
  }
}
