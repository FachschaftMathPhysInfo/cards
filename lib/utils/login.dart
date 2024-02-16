import 'package:cards/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cards/constants.dart' as c;

Future<void> login(String username, String password) async {
  final Uri loginUri = Uri.parse(c.GraphQL.loginUrl + username);
  try {
    final http.Response response = await http.get(loginUri);
    logflob.info(response.statusCode);
    if (response.statusCode == 200) {
      // Login successful, extract and store JWT token
      final Map<String, dynamic> data = jsonDecode(response.body);
      final String jwtToken = data['jwt'];

      // Store the token securely (e.g., using Flutter Secure Storage)
      // This example uses SharedPreferences for simplicity
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString('jwtToken', jwtToken);

      logflob.info('Login successful! JWT Token: $jwtToken');
    } else {
      // Login failed, display error message
      logflob.shout('Login failed. Status code: ${response.statusCode}');
    }
  } catch (error) {
    logflob.shout('Error occurred during login: $error');
  }
}
