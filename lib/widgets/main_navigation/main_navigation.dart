import 'package:coffeeconti/widgets/tabs/add.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/constants/screenSize.dart';
import '../../components/constants/sizes.dart';
import '../tabs/discover.dart';
import '../tabs/map_tab/map.dart';
import 'widgets/nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    CafeMap(),
    AddMyCafe(),
    UserPage(),
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
              NavTab(
                isSelected: selectedIndex == 0,
                iconName: 'tab_home',
              ),
              NavTab(
                isSelected: selectedIndex == 1,
                iconName: 'tab_add',
              ),
              NavTab(
                isSelected: selectedIndex == 2,
                iconName: 'tab_bookmark',
              ),
              NavTab(
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
