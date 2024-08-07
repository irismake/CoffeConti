import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bookmark/bookmark_page.dart';
import '../place_picker/place_picker_page.dart';
import '../user/user_page.dart';
import '../map/map.dart';
import '../../components/button/nav_tab_button.dart';

class MainViewNavigator extends StatefulWidget {
  MainViewNavigator({super.key});

  @override
  State<MainViewNavigator> createState() => _MainViewNavigatorState();
}

class _MainViewNavigatorState extends State<MainViewNavigator> {
  int selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    CafeMap(),
    PlacePickerPage(),
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
                iconName: 'tab_place_picker',
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
