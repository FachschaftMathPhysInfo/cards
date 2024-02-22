import 'package:cards/views/filled_text_button.dart';
import 'package:flutter/material.dart';
import 'package:cards/constants.dart' as c;

void simpleAlert(BuildContext context, String text,
        [VoidCallback? isLeaving]) =>
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          titleTextStyle: const TextStyle(fontSize: 20),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            if (isLeaving == null) ...[
              FilledTextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: c.Strings.okay,
                bgColor: c.Colors.blue,
                fgColor: Colors.white,
              )
            ] else ...[
              FilledTextButton(
                  text: c.Strings.cancel,
                  bgColor: c.Colors.blue,
                  fgColor: Colors.white,
                  onPressed: () => Navigator.of(context).pop()),
              FilledTextButton(
                  text: c.Strings.yes,
                  bgColor: c.Colors.red,
                  fgColor: Colors.white,
                  onPressed: () {
                    isLeaving();
                    Navigator.of(context).pop();
                  })
            ]
          ],
        );
      },
    );
