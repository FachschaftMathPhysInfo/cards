import 'package:flutter/material.dart';

class ColoredIconButton extends StatelessWidget {
  final Icon icon;
  final Color color;
  final VoidCallback onPressed;
  const ColoredIconButton(this.icon, this.color, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: color, foregroundColor: Colors.white),
      child: icon,
    );
  }
}
