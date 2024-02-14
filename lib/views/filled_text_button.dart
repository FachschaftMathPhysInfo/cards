import 'package:flutter/material.dart';

class FilledTextButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color fgColor;
  final VoidCallback? onPressed;
  const FilledTextButton(
      {required this.text,
      required this.bgColor,
      required this.fgColor,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: fgColor,
          shape: const RoundedRectangleBorder(),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 15),
        ));
  }
}
