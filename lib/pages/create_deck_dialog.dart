import 'package:cards/main.dart';
import 'package:cards/views/flag.dart';
import 'package:cards/views/simple_alert.dart';
import "package:http/http.dart";
import 'package:cards/views/simple_dropdown_menu.dart';
import 'package:cards/views/filled_text_button.dart';
import 'package:cards/views/simple_text_form_field.dart';
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

  String selectedSemester =
      DateTime.now().month >= 10 || DateTime.now().month <= 3
          ? c.Strings.wise
          : c.Strings.sose;
  int selectedYear = DateTime.now().month < 10
      ? (DateTime.now().year - 1)
      : DateTime.now().year;
  String selectedLanguage = "de";

  FilePickerResult? _deckFileResult;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        Mutation(
            options: MutationOptions(
              document: gql(c.GraphQL.createDeck),
              onError: (OperationException? error) {
                simpleAlert(context, c.Strings.error);
                logflob.shout(error.toString());
              },
              onCompleted: (dynamic resultData) {
                Navigator.of(context).pop();
                simpleAlert(context, c.Strings.uploadSuccessMessage);
                logflob.info("$resultData created");
              },
            ),
            builder:
                (RunMutation createDeckMutation, QueryResult? createResult) {
              createDeck() {
                final selectedDeck = MultipartFile.fromBytes(
                    "", _deckFileResult!.files.single.bytes!,
                    filename: _deckFileResult!.files.single.name);
                createDeckMutation({
                  "input": {
                    "subject": subjectController.text,
                    "module": moduleController.text,
                    "moduleAlt": moduleAltController.text,
                    "examiners": examinersController.text,
                    "language": selectedLanguage,
                    "semester": selectedSemester,
                    "year": selectedYear,
                    "file": selectedDeck
                  }
                });
              }

              return SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledTextButton(
                      text: c.Strings.submit,
                      bgColor: c.Colors.turquoiseDark,
                      fgColor: Colors.white,
                      onPressed: moduleController.text.isNotEmpty &&
                              moduleAltController.text.isNotEmpty &&
                              subjectController.text.isNotEmpty &&
                              examinersController.text.isNotEmpty &&
                              _deckFileResult != null
                          ? () {
                              createDeck();
                            }
                          : null));
            })
      ],
      title: Row(
        children: [
          const Expanded(child: Text(c.Strings.contributeDeck)),
          IconButton(
              onPressed: () {
                if (moduleController.text.isNotEmpty ||
                    moduleAltController.text.isNotEmpty ||
                    subjectController.text.isNotEmpty ||
                    examinersController.text.isNotEmpty ||
                    _deckFileResult != null) {
                  simpleAlert(context, c.Strings.leaveDialog, () {
                    Navigator.of(context).pop();
                  });
                } else {
                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(Icons.close))
        ],
      ),
      content: Builder(builder: (context) {
        return Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SimpleTextFormField(
                    labelText: c.Strings.module,
                    controller: moduleController,
                    autofocus: true,
                    icon: const Icon(Icons.subject),
                  ),
                  const SizedBox(height: 10),
                  SimpleTextFormField(
                      labelText: c.Strings.moduleAlt,
                      controller: moduleAltController,
                      maxLength: 6,
                      helperText: c.Strings.moduleAltHelper,
                      icon: const Icon(Icons.short_text)),
                  const SizedBox(height: 10),
                  SimpleTextFormField(
                    labelText: c.Strings.subject,
                    controller: subjectController,
                    icon: const Icon(Icons.school),
                  ),
                  const SizedBox(height: 10),
                  SimpleTextFormField(
                    labelText: c.Strings.prof,
                    controller: examinersController,
                    icon: const Icon(Icons.person),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(c.Strings.semester),
                      const SizedBox(width: 10),
                      SimpleDropdownMenu(
                        initDropdownValue: selectedSemester,
                        list: const [
                          {c.Strings.sose: Text(c.Strings.sose)},
                          {c.Strings.wise: Text(c.Strings.wise)}
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedSemester = value!;
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                      SimpleDropdownMenu(
                          list: List.generate(
                              15,
                              (i) => {
                                    (DateTime.now().year - i).toString(): Text(
                                        (DateTime.now().year - i).toString())
                                  }),
                          initDropdownValue: selectedYear.toString(),
                          onChanged: (value) {
                            setState(() {
                              selectedYear = value!;
                            });
                          }),
                      Expanded(child: Container()),
                      const Text(c.Strings.language),
                      const SizedBox(width: 10),
                      SimpleDropdownMenu(
                          list: const [
                            {"de": Flag(languageCode: "de")},
                            {"en": Flag(languageCode: "en")}
                          ],
                          initDropdownValue: selectedLanguage,
                          onChanged: (value) {
                            setState(() {
                              selectedLanguage = value!;
                            });
                          })
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                  ),
                  const Text(
                    c.Strings.userConstent,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
