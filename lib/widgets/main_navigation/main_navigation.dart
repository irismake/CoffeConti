import 'package:coffeeconti/widgets/tabs/add.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/screenSize.dart';
import '../../constants/sizes.dart';
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
    //_agreementPopUp(),
    AddMyCafe(),
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
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _widgetOptions.elementAt(selectedIndex),
        bottomNavigationBar: BottomAppBar(
          height: 60.0.h,
          color: Colors.black,
          child: TabBar(
            dividerHeight: 0,
            indicatorColor: Theme.of(context).primaryColor,
            isScrollable: false,
            onTap: (index) {
              _onTap(index);
            },
            tabs: <Widget>[
              NavTab(
                isSelected: selectedIndex == 0,
                icon: Icons.location_on_outlined,
                selectedIcon: Icons.location_on_rounded,
              ),
              NavTab(
                isSelected: selectedIndex == 1,
                icon: Icons.shopping_bag_outlined,
                selectedIcon: Icons.shopping_bag,
              ),
              NavTab(
                isSelected: selectedIndex == 2,
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
              )
            ],
          ),
        ),
      ),
    );
  }
}
