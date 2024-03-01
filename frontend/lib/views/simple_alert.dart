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
          titleTextStyle: Theme.of(context).textTheme.headlineMedium,
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            if (isLeaving == null) ...[
              FilledTextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: c.Strings.okay,
                bgColor: c.Colors.blue,
              )
            ] else ...[
              FilledTextButton(
                  text: c.Strings.cancel,
                  bgColor: c.Colors.blue,
                  onPressed: () => Navigator.of(context).pop()),
              FilledTextButton(
                  text: c.Strings.yes,
                  bgColor: c.Colors.red,
                  onPressed: () {
                    isLeaving();
                    Navigator.of(context).pop();
                  })
            ]
          ],
        );
      },
    );
