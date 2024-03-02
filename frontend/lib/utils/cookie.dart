// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:convert';
import 'package:cards/main.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';

String? getValueOfCookie(String key) {
  String? cookieString = html.document.cookie;
  if (cookieString == null) {
    logflob.shout("Failed to get cookies");
    return null;
  }

  List<String> cookies = cookieString.split("; ");
  for (String cookie in cookies) {
    List<String> parts = cookie.split("=");
    if (parts[0] == key) {
      return parts[1];
    }
  }

  return null;
}

Map<String, dynamic>? getDecodedToken() {
  final jwtToken = getValueOfCookie("jwt");

  if (jwtToken != null) {
    Map<String, dynamic> decodedToken = Jwt.parseJwt(jwtToken);
    decodedToken["user"] = jsonDecode(decodedToken["user"])["username"];
    decodedToken["jwt"] = jwtToken;
    logflob.shout("token: $decodedToken");
    return decodedToken;
  }

  return null;
}

void setCookie(String cookie) {
  try {
    html.document.cookie = cookie;
  } catch (e) {
    logflob.shout("error during setting cookie: $e");
  }
}

eraseCookie(String cookie) {
  setCookie("$cookie=; Max-Age=0000000000");
}

void setTokenCookieFromUrl() {
  final url = Uri.base;
  final queryParams = url.queryParameters;
  var token = queryParams["token"];

  if (token != null) {
    setCookie("jwt=$token; Path:/; SameSite=Strict");
  }
}

void setThemeCookie() {
  if (getValueOfCookie("theme") == null) {
    String theme = ThemeMode.system == ThemeMode.dark ? "dark" : "light";
    setCookie("theme=$theme");
  }
}
