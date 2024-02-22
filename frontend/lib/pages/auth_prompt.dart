import 'package:cards/utils/login.dart';
import 'package:cards/views/filled_text_button.dart';
import 'package:cards/views/simple_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:cards/constants.dart' as c;

class AuthPrompt extends StatefulWidget {
  const AuthPrompt({super.key});

  @override
  State<AuthPrompt> createState() => _AuthPromptState();
}

class _AuthPromptState extends State<AuthPrompt> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Expanded(child: Text(c.Strings.fsLogin)),
          IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close))
        ],
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: FilledTextButton(
              text: c.Strings.login,
              bgColor: c.Colors.turquoiseDark,
              fgColor: Colors.white,
              onPressed: () {
                login(_usernameController.text, _passwordController.text);
              }),
        )
      ],
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        SimpleTextFormField(
            labelText: c.Strings.username,
            controller: _usernameController,
            autofocus: true,
            icon: const Icon(Icons.person)),
        const SizedBox(height: 10),
        SimpleTextFormField(
            labelText: c.Strings.password,
            controller: _passwordController,
            isPassword: true,
            icon: const Icon(Icons.key))
      ]),
    );
  }
}
