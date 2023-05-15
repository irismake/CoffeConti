import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_keyboard/tabs/add.dart';
import 'package:simple_keyboard/tabs/discover.dart';
import 'package:simple_keyboard/tabs/map.dart';
import 'package:simple_keyboard/tabs/profile.dart';

import '../../../constants/gaps.dart';

class NavTab extends StatefulWidget {
  const NavTab({
    super.key,
    required this.text,
    required this.isSelected,
    required this.selectedIndex,
    required this.icon,
    required this.selectedIcon,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final int selectedIndex;
  final IconData icon;
  final IconData selectedIcon;
  final Function onTap;

  @override
  State<NavTab> createState() => _NavTabState();
}

class _NavTabState extends State<NavTab> {
  // void _onTap(int index) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => _widgetOptions.elementAt(index),
  //       fullscreenDialog: false,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Container(
        color: Colors.black,
        child: AnimatedOpacity(
          opacity: widget.isSelected ? 1 : 0.6,
          duration: Duration(milliseconds: 200),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                widget.isSelected ? widget.selectedIcon : widget.icon,
                color: Colors.white,
              ),
              Gaps.v5,
              Text(
                widget.text,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
