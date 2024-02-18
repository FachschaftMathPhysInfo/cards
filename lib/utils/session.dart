// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:convert';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:cards/main.dart';

Map<String, dynamic>? getDecodedToken() {
  String? cookieString = document.cookie;
  if (cookieString == null) {
    logflob.shout("Failed to get cookies");
    return null;
  }

  List<String> cookies = cookieString.split("; ");
  for (String cookie in cookies) {
    List<String> parts = cookie.split("=");
    if (parts[0] == "jwt") {
      final jwtToken = parts[1];
      Map<String, dynamic> decodedToken = Jwt.parseJwt(jwtToken);
      decodedToken["user"] = jsonDecode(decodedToken["user"])["username"];
      decodedToken["jwt"] = jwtToken;
      logflob.shout("token: $decodedToken");
      return decodedToken;
    }
  }

  return null;
}
