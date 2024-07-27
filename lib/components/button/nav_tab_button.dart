import 'package:flutter/material.dart';

class NavTabButton extends StatelessWidget {
  const NavTabButton({
    super.key,
    required this.isSelected,
    required this.iconName,
  });

  final bool isSelected;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      isSelected
          ? 'assets/icons/${iconName}_fill.png'
          : 'assets/icons/${iconName}_light.png',
    );
  }
}
