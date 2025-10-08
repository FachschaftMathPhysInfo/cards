import 'package:flutter/material.dart';

class IconTextItem extends StatelessWidget {
  final String text;
  final Icon icon;
  const IconTextItem({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [icon, const SizedBox(width: 10), Text(text)],
    );
  }
}
