import 'package:cards/main.dart';
import 'package:cards/modules/deck_form_fields.dart';
import 'package:cards/views/simple_alert.dart';
import "package:http/http.dart";
import 'package:cards/views/filled_text_button.dart';
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
                      onPressed: () => _deckFileResult != null
                          ? subjectController.text.isNotEmpty &&
                                  moduleController.text.isNotEmpty &&
                                  moduleAltController.text.isNotEmpty &&
                                  examinersController.text.isNotEmpty
                              ? createDeck()
                              : simpleAlert(context, c.Strings.submitError)
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
                  DeckFormFields(
                    moduleController: moduleController,
                    moduleAltController: moduleAltController,
                    subjectController: subjectController,
                    examinersController: examinersController,
                    selectedLanguage: selectedLanguage,
                    selectedYear: selectedYear,
                    selectedSemester: selectedSemester,
                    onSemesterChange: (semester) {
                      setState(() {
                        selectedSemester = semester;
                      });
                    },
                    onYearChange: (year) {
                      setState(() {
                        selectedYear = int.parse(year);
                      });
                    },
                    onLanguageChange: (languageCode) {
                      setState(() {
                        selectedLanguage = languageCode;
                      });
                    },
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
                    c.Strings.userConsent,
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
