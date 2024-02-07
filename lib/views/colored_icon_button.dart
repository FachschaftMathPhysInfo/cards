import 'package:flutter/material.dart';

class ColoredIconButton extends StatelessWidget {
  final Icon icon;
  final Color color;
  const ColoredIconButton(this.icon, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: color, foregroundColor: Colors.white),
      child: icon,
    );
  }
}
