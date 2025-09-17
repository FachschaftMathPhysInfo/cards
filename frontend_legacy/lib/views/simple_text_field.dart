import 'package:flutter/material.dart';
import 'package:cards/constants.dart' as c;

class SimpleTextField extends StatelessWidget {
  final Function(String?) onChanged;
  final String label;
  final String hint;
  final bool autofocus;
  final Icon icon;
  const SimpleTextField(
      {super.key,
      required this.onChanged,
      required this.label,
      required this.hint,
      this.autofocus = false,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autofocus,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: const TextStyle(color: Colors.grey),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: c.Colors.turquoiseLight),
          ),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: c.Colors.turquoiseDark)),
          prefixIcon: icon),
      onChanged: onChanged,
    );
  }
}
