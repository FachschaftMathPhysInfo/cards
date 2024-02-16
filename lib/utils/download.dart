// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:cards/main.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'package:path/path.dart' as path;

Future<void> download(String url, String newFilename) async {
  try {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Uint8List bytes = response.bodyBytes;
      Blob blob = Blob([bytes]);
      AnchorElement anchorElement =
          AnchorElement(href: Url.createObjectUrlFromBlob(blob));
      anchorElement.download = "$newFilename${path.extension(url)}";

      anchorElement.click();
    } else {
      logflob.shout('Failed to download file: ${response.statusCode}');
    }
  } catch (e) {
    logflob.shout('Error downloading file: $e');
  }
}
