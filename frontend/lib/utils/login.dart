import 'package:cards/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cards/constants.dart' as c;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

Future<void> login(String username, String password) async {
  final Uri loginUrl = Uri.parse(c.GraphQL.loginUrl);
  try {
    final http.Response response = await http.post(
      loginUrl,
      headers: {
        'Authorization':
            'Basic ${base64Encode(utf8.encode("$username:$password"))}',
      },
    );
    logflob.info(response.statusCode);
    if (response.statusCode == 200) {
      logflob.shout(response.headers);
      // Login successful, extract and store JWT token
      final Map<String, dynamic> data = jsonDecode(response.body);
      final String jwtToken = data["jwt"];
      logflob.shout(jwtToken);

      html.document.cookie = "jwt=$jwtToken; Path:/; SameSite=None";
      html.window.location.href = "/";

      logflob.info('Login successful! JWT Token: $jwtToken');
    } else {
      logflob.shout('Login failed. Status code: ${response.statusCode}');
    }
  } catch (error) {
    logflob.shout('Error occurred during login: $error');
  }
}
