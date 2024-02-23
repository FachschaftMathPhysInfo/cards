import 'package:flutter/material.dart';
import 'package:cards/constants.dart' as c;

class InfoField extends StatelessWidget {
  final String text;
  const InfoField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(width: 2.0, color: c.Colors.turquoiseDark),
          color: c.Colors.turquoiseLight),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.lightbulb_outline_rounded),
          const SizedBox(width: 10),
          Text(text)
        ],
      ),
    );
  }
}
