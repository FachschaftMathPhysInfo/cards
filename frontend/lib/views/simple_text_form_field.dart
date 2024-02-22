import 'package:flutter/material.dart';
import 'package:cards/constants.dart' as c;

class SimpleTextFormField extends StatelessWidget {
  final String labelText;
  final String helperText;
  final TextEditingController controller;
  final Icon icon;
  final bool autofocus;
  final int maxLength;
  final bool isPassword;
  const SimpleTextFormField(
      {required this.labelText,
      required this.controller,
      required this.icon,
      this.autofocus = false,
      this.maxLength = 30,
      this.helperText = "",
      this.isPassword = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: maxLength,
      autofocus: autofocus,
      cursorHeight: 20,
      cursorColor: Colors.grey,
      obscureText: isPassword,
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
