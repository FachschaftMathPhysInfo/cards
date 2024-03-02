import 'package:cards/main.dart';
import 'package:cards/modules/deck_form_fields.dart';
import 'package:cards/views/filled_text_button.dart';
import 'package:cards/views/simple_alert.dart';
import 'package:flutter/material.dart';
import 'package:cards/constants.dart' as c;
import 'package:graphql_flutter/graphql_flutter.dart';

// ignore: must_be_immutable
class EditDeckDialog extends StatefulWidget {
  final Function refetchQuery;
  final String hash;
  final TextEditingController moduleController = TextEditingController();
  final TextEditingController moduleAltController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController examinersController = TextEditingController();
  String semester;
  int year;
  String language;

  EditDeckDialog(
      {super.key,
      required String module,
      required String moduleAlt,
      required String subject,
      required String examiners,
      required this.semester,
      required this.year,
      required this.language,
      required this.hash,
      required this.refetchQuery}) {
    moduleController.text = module;
    moduleAltController.text = moduleAlt;
    subjectController.text = subject;
    examinersController.text = examiners;
  }

  @override
  State<EditDeckDialog> createState() => _EditDeckDialogState();
}

class _EditDeckDialogState extends State<EditDeckDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        Mutation(
            options: MutationOptions(
              document: gql(c.GraphQL.updateDeck),
              onError: (OperationException? error) {
                simpleAlert(context, c.Strings.error);
                logflob.shout(error.toString());
              },
              onCompleted: (dynamic resultData) {
                Navigator.of(context).pop();
                widget.refetchQuery();
                logflob.info("$resultData created");
              },
            ),
            builder:
                (RunMutation updateDeckMutation, QueryResult? updateResult) {
              updateDeck() {
                updateDeckMutation({
                  "hash": widget.hash,
                  "input": {
                    "subject": widget.subjectController.text,
                    "module": widget.moduleController.text,
                    "moduleAlt": widget.moduleAltController.text,
                    "examiners": widget.examinersController.text,
                    "language": widget.language,
                    "semester": widget.semester,
                    "year": widget.year,
                  }
                });
              }

              return SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledTextButton(
                      text: c.Strings.save,
                      bgColor: c.Colors.turquoiseDark,
                      fgColor: Colors.white,
                      onPressed: () {
                        widget.subjectController.text.isNotEmpty &&
                                widget.moduleController.text.isNotEmpty &&
                                widget.moduleAltController.text.isNotEmpty &&
                                widget.examinersController.text.isNotEmpty
                            ? updateDeck()
                            : simpleAlert(context, c.Strings.submitError);
                      }));
            })
      ],
      title: Row(
        children: [
          const Expanded(child: Text(c.Strings.editDeck)),
          IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close))
        ],
      ),
      content: Builder(builder: (context) {
        return SizedBox(
          width: 500,
          height: 420,
          child: SingleChildScrollView(
            child: DeckFormFields(
              moduleController: widget.moduleController,
              moduleAltController: widget.moduleAltController,
              subjectController: widget.subjectController,
              examinersController: widget.examinersController,
              selectedLanguage: widget.language,
              selectedYear: widget.year,
              selectedSemester: widget.semester,
              onSemesterChange: (semester) {
                setState(() {
                  widget.semester = semester;
                });
              },
              onYearChange: (year) {
                setState(() {
                  widget.year = int.parse(year);
                });
              },
              onLanguageChange: (languageCode) {
                setState(() {
                  widget.language = languageCode;
                });
              },
            ),
          ),
        );
      }),
    );
  }
}
