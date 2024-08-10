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
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60.h,
        padding: EdgeInsets.only(
          bottom: 10.0,
        ),
        color: Colors.black,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            NavTabButton(
              isSelected: selectedIndex == 0,
              iconName: 'tab_home',
              onTap: () => _onTap(0),
            ),
            NavTabButton(
              isSelected: selectedIndex == 1,
              iconName: 'tab_place_picker',
              onTap: () => _onTap(1),
            ),
            NavTabButton(
              isSelected: selectedIndex == 2,
              iconName: 'tab_bookmark',
              onTap: () => _onTap(2),
            ),
            NavTabButton(
              isSelected: selectedIndex == 3,
              iconName: 'tab_user',
              onTap: () => _onTap(3),
            ),
          ],
        ),
      ),
    );
  }
}
