import 'package:flutter/material.dart';
import 'package:cards/constants.dart' as c;

class SimpleTextField extends StatelessWidget {
  final String labelText;
  final String helperText;
  final TextEditingController controller;
  final Icon icon;
  final bool autofocus;
  final int maxLength;
  const SimpleTextField(
      {required this.labelText,
      required this.controller,
      required this.icon,
      this.autofocus = false,
      this.maxLength = 30,
      this.helperText = "",
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: maxLength,
      autofocus: autofocus,
      cursorHeight: 20,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          icon: icon,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          helperText: helperText != "" ? helperText : null,
          suffixIcon: const Text(
            "*",
            style: TextStyle(color: Colors.grey),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: c.Colors.turquoiseLight),
          ),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: c.Colors.turquoiseDark))),
    );
  }
}
