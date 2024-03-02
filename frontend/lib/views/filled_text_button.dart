import 'package:flutter/material.dart';

class FilledTextButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color? fgColor;
  final VoidCallback? onPressed;
  final double borderRadius;
  const FilledTextButton(
      {required this.text,
      required this.bgColor,
      this.fgColor,
      required this.onPressed,
      super.key,
      this.borderRadius = 0});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: fgColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 15),
        ));
  }
}
