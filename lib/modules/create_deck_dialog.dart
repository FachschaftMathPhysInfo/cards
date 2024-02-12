import 'dart:io';

import 'package:cards/views/colored_dropdown_menu.dart';
import 'package:cards/views/filled_text_button.dart';
import 'package:cards/views/simple_textfield.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cards/constants.dart' as c;
import 'package:graphql_flutter/graphql_flutter.dart';

class CreateDeckDialog extends StatefulWidget {
  const CreateDeckDialog({super.key});

  @override
  State<CreateDeckDialog> createState() => _CreateDeckDialogState();
}

class _CreateDeckDialogState extends State<CreateDeckDialog> {
  final TextEditingController moduleController = TextEditingController();
  final TextEditingController moduleAltController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController examinersController = TextEditingController();
  late File deckFile;
  DateTime selectedDate = DateTime.now();

  FilePickerResult? _deckFileResult;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(c.Strings.contributeDeck),
      content: Builder(builder: (context) {
        return Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500, maxHeight: 700),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SimpleTextField(
                    labelText: c.Strings.module,
                    controller: moduleController,
                    autofocus: true,
                    icon: const Icon(Icons.subject),
                  ),
                  const SizedBox(height: 10),
                  SimpleTextField(
                      labelText: c.Strings.moduleAlt,
                      controller: moduleAltController,
                      maxLength: 5,
                      helperText: c.Strings.moduleAltHelper,
                      icon: const Icon(null)),
                  const SizedBox(height: 10),
                  SimpleTextField(
                    labelText: c.Strings.subject,
                    controller: subjectController,
                    icon: const Icon(Icons.subject),
                  ),
                  const SizedBox(height: 10),
                  SimpleTextField(
                    labelText: c.Strings.prof,
                    controller: examinersController,
                    icon: const Icon(Icons.person),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(c.Strings.semester),
                      const SizedBox(width: 10),
                      ColoredDropdownMenu(
                        list: const [c.Strings.sose, c.Strings.wise],
                        initDropdownValue: DateTime.now().month >= 10 ||
                                DateTime.now().month <= 3
                            ? 1
                            : 0,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(c.Strings.year),
                      const SizedBox(
                        width: 10,
                      ),
                      FilledTextButton(
                        onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: SizedBox(
                                width: 300,
                                height: 300,
                                child: YearPicker(
                                  firstDate:
                                      DateTime(DateTime.now().year - 100, 1),
                                  lastDate: DateTime(DateTime.now().year),
                                  selectedDate: selectedDate,
                                  onChanged: (DateTime dateTime) {
                                    setState(() {
                                      selectedDate = dateTime;
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                        text: selectedDate.year.toString(),
                        bgColor: c.Colors.turquoiseLight,
                        fgColor: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      if (_deckFileResult == null) ...{
                        FilledTextButton(
                            text: c.Strings.upload,
                            bgColor: c.Colors.turquoiseLight,
                            fgColor: Colors.white,
                            onPressed: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                      type: FileType.custom,
                                      allowedExtensions: ["apkg", "colpkg"]);
                              if (result != null) {
                                setState(() {
                                  _deckFileResult = result;
                                });
                              }
                            }),
                      } else ...{
                        IconButton(
                          icon: const Icon(Icons.delete),
                          style: IconButton.styleFrom(
                              foregroundColor: c.Colors.red),
                          onPressed: () {
                            setState(() {
                              _deckFileResult = null;
                            });
                          },
                        ),
                        Text(_deckFileResult!.files.single.name),
                      }
                    ],
                  ),
                  Expanded(child: Container()),
                  const Text(
                    c.Strings.userConstent,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: FilledTextButton(
                        text: c.Strings.submit,
                        bgColor: c.Colors.turquoiseDark,
                        fgColor: Colors.white,
                        onPressed: () {
                          _performMutation(context);
                          Navigator.pop(context);
                        }),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  void _performMutation(BuildContext context) async {
    final MutationOptions deckOptions =
        MutationOptions(document: gql(c.GraphQL.createDeck), variables: {
      "input": {
        "subject": subjectController.text,
        "module": moduleController.text,
        "moduleAlt": moduleAltController.text,
        "examiners": examinersController.text,
        "year": selectedDate.year,
        "file": deckFile
      }
    });
  }
}
