import 'package:cards/main.dart';
import 'package:cards/constants.dart' as c;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

void setCookieFromUrl() {
  final url = Uri.base;
  final queryParams = url.queryParameters;
  var token = queryParams["token"];

  if (token != null) {
    html.document.cookie = "jwt=$token; Path:/; SameSite=None";
  }
}

Future<void> login() async {
  try {
    html.window.location.href = c.GraphQL.loginUrl;
  } catch (error) {
    logflob.shout('Error occurred during login: $error');
  }
}
