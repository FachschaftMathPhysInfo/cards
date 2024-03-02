// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:cards/main.dart';

Future<void> openUrl(String url, {bool newTab = false}) async {
  try {
    html.window.open(url, newTab ? "_blank" : "_self");
  } catch (error) {
    logflob.shout('Error occurred during redirect: $error');
  }
}
