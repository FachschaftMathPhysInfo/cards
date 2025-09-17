import 'package:cards/constants.dart' as c;
import 'package:cards/utils/cookie.dart';
import 'package:cards/utils/web.dart';

void login() {
  openUrl(c.GraphQL.loginUrl);
}

void logout() {
  eraseCookie("jwt");
  openUrl("/");
}
