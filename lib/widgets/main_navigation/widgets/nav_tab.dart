import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/gaps.dart';

class NavTab extends StatefulWidget {
  const NavTab({
    super.key,
    required this.text,
    required this.isSelected,
    required this.icon,
    required this.selectedIcon,
    required this.onTap,
  });

  final String text;
  final bool isSelected;

  final IconData icon;
  final IconData selectedIcon;
  final Function onTap;

  @override
  State<NavTab> createState() => _NavTabState();
}

class _NavTabState extends State<NavTab> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Container(
        color: Colors.black,
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
            Text(
              widget.text,
              style: TextStyle(
                color: widget.isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.grey[600],
              ),
            )
          ],
        ),
      ),
    );
  }
}
