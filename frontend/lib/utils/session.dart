import 'package:cards/constants.dart' as c;
import 'package:cards/utils/cookie.dart';
import 'package:cards/utils/web.dart';

Future<void> login() async {
  openUrl(c.GraphQL.loginUrl);
}

void logout() {
  eraseCookie("jwt");
  openUrl("/");
}
