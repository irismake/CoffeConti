import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    Discover(),
    Discover(),
  ];

  void _onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: SizedBox(
          height: bottomNavigationBarHeight(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavTab(
                text: 'Map',
                isSelected: selectedIndex == 0,
                icon: Icons.location_on_outlined,
                selectedIcon: Icons.location_on_rounded,
                onTap: () => _onTap(0),
              ),
              NavTab(
                text: 'Order',
                isSelected: selectedIndex == 1,
                icon: Icons.shopping_bag_outlined,
                selectedIcon: Icons.shopping_bag,
                onTap: () => _onTap(1),
              ),
              NavTab(
                text: 'My',
                isSelected: selectedIndex == 2,
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                onTap: () => _onTap(2),
              )
            ],
          ),
        ),
      ),
    );
  }
}
