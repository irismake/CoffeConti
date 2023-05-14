import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:simple_keyboard/tabs/map.dart';
import '../../constants/sizes.dart';
import '../../constants/gaps.dart';
import 'widgets/nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final screens = [
    const Center(
      child: Text('Map'),
    ),
    const Center(
      child: Text('Search'),
    ),
    const Center(
      child: Text('Add address'),
    ),
    const Center(
      child: Text('User'),
    ),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostMapButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CafeMap(),
        fullscreenDialog: true,
      ),
    );
    print('go');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      // body: Stack(
      //   children: [
      //     Offstage(
      //       offstage: _selectedIndex != 0,
      //     ),
      //     Offstage(
      //       offstage: _selectedIndex != 1,
      //       child: screens[_selectedIndex],
      //     ),
      //     Offstage(
      //       offstage: _selectedIndex != 2,
      //       child: screens[_selectedIndex],
      //     ),
      //     Offstage(
      //       offstage: _selectedIndex != 3,
      //       child: screens[_selectedIndex],
      //     ),
      //   ],
      // ),
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
              Gaps.h20,
              GestureDetector(
                onTap: _onPostMapButtonTap,
                child: Container(
                  width: 20,
                  height: 20,
                  color: Colors.red,
                ),
              ),
              Gaps.h20,
              NavTab(
                text: 'Map',
                isSelected: _selectedIndex == 0,
                icon: Icons.location_on_outlined,
                selectedIcon: Icons.location_on_rounded,
                onTap: () => _onTap(0),
              ),
              NavTab(
                text: 'Discover',
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.compass,
                selectedIcon: FontAwesomeIcons.solidCompass,
                onTap: () => _onTap(1),
              ),
              NavTab(
                text: 'Add',
                isSelected: _selectedIndex == 2,
                icon: FontAwesomeIcons.plus,
                selectedIcon: FontAwesomeIcons.plus,
                onTap: () => _onTap(2),
              ),
              NavTab(
                text: 'Profile',
                isSelected: _selectedIndex == 3,
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
