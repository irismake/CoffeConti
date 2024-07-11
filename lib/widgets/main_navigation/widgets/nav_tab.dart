import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/gaps.dart';

class NavTab extends StatefulWidget {
  const NavTab({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.selectedIcon,
  });

  final bool isSelected;

  final IconData icon;
  final IconData selectedIcon;

  @override
  State<NavTab> createState() => _NavTabState();
}

class _NavTabState extends State<NavTab> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              widget.isSelected ? widget.selectedIcon : widget.icon,
              color: widget.isSelected
                  ? Theme.of(context).primaryColor
                  : Colors.grey[600],
            ),
            Gaps.v5,
          ],
        ),
      ),
    );
  }
}
