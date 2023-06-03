import 'package:coffeeconti/data/cafe_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:coffeeconti/tabs/add.dart';
import 'package:coffeeconti/tabs/discover.dart';

import 'package:coffeeconti/tabs/map.dart';
import 'package:coffeeconti/tabs/profile.dart';
import '../../constants/sizes.dart';
import '../../constants/gaps.dart';
import 'widgets/nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    CafeData(),
    Discover(),
    AddMyCafe(),
    UserProfile(),
  ];

  void _onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size2,
            vertical: Sizes.size12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavTab(
                text: 'Map',
                selectedIndex: 0,
                isSelected: selectedIndex == 0,
                icon: Icons.location_on_outlined,
                selectedIcon: Icons.location_on_rounded,
                onTap: () => _onTap(0),
              ),
              NavTab(
                text: 'Discover',
                selectedIndex: 1,
                isSelected: selectedIndex == 1,
                icon: FontAwesomeIcons.compass,
                selectedIcon: FontAwesomeIcons.solidCompass,
                onTap: () => _onTap(1),
              ),
              NavTab(
                text: 'Add',
                selectedIndex: 2,
                isSelected: selectedIndex == 2,
                icon: FontAwesomeIcons.plus,
                selectedIcon: FontAwesomeIcons.plus,
                onTap: () => _onTap(2),
              ),
              NavTab(
                text: 'Profile',
                selectedIndex: 3,
                isSelected: selectedIndex == 3,
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                onTap: () => _onTap(3),
              )
            ],
          ),
        ),
      ),
    );
  }
}
