import 'package:cards/main.dart';
import 'package:cards/constants.dart' as c;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

Future<void> login() async {
  try {
    html.window.location.href = c.GraphQL.loginUrl;
  } catch (error) {
    logflob.shout('Error occurred during login: $error');
  }
}
