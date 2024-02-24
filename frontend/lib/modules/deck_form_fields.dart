import 'package:cards/views/flag.dart';
import 'package:cards/views/simple_dropdown_menu.dart';
import 'package:cards/views/simple_text_form_field.dart';
import 'package:cards/constants.dart' as c;
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DeckFormFields extends StatefulWidget {
  final TextEditingController? moduleController;
  final TextEditingController? moduleAltController;
  final TextEditingController? subjectController;
  final TextEditingController? examinersController;
  final Function(dynamic) onSemesterChange;
  final Function(dynamic) onYearChange;
  final Function(dynamic) onLanguageChange;
  String selectedSemester;
  int selectedYear;
  String selectedLanguage;
  DeckFormFields(
      {super.key,
      required this.moduleController,
      required this.moduleAltController,
      required this.subjectController,
      required this.examinersController,
      required this.selectedLanguage,
      required this.selectedYear,
      required this.selectedSemester,
      required this.onSemesterChange,
      required this.onYearChange,
      required this.onLanguageChange});

  @override
  State<DeckFormFields> createState() => _DeckFormFieldsState();
}

class _DeckFormFieldsState extends State<DeckFormFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SimpleTextFormField(
          labelText: c.Strings.module,
          controller: widget.moduleController!,
          autofocus: true,
          maxLength: 35,
          icon: const Icon(Icons.subject),
        ),
        const SizedBox(height: 10),
        SimpleTextFormField(
            labelText: c.Strings.moduleAlt,
            controller: widget.moduleAltController!,
            maxLength: 6,
            helperText: c.Strings.moduleAltHelper,
            icon: const Icon(Icons.short_text)),
        const SizedBox(height: 10),
        SimpleTextFormField(
          labelText: c.Strings.subject,
          controller: widget.subjectController!,
          maxLength: 35,
          icon: const Icon(Icons.school),
        ),
        const SizedBox(height: 10),
        SimpleTextFormField(
          labelText: c.Strings.prof,
          controller: widget.examinersController!,
          icon: const Icon(Icons.person),
          maxLength: 35,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Text(c.Strings.semester),
            const SizedBox(width: 10),
            SimpleDropdownMenu(
              initDropdownValue: widget.selectedSemester,
              list: const [
                {c.Strings.sose: Text(c.Strings.sose)},
                {c.Strings.wise: Text(c.Strings.wise)}
              ],
              onChanged: widget.onSemesterChange,
            ),
            const SizedBox(width: 10),
            SimpleDropdownMenu(
                list: List.generate(
                    15,
                    (i) => {
                          (DateTime.now().year - i).toString():
                              Text((DateTime.now().year - i).toString())
                        }),
                initDropdownValue: widget.selectedYear.toString(),
                onChanged: widget.onYearChange),
            Expanded(child: Container()),
            const Text(c.Strings.language),
            const SizedBox(width: 10),
            SimpleDropdownMenu(
                list: const [
                  {"de": Flag(languageCode: "de")},
                  {"en": Flag(languageCode: "en")},
                  {"fr": Flag(languageCode: "fr")},
                  {"es": Flag(languageCode: "es")}
                ],
                initDropdownValue: widget.selectedLanguage,
                onChanged: widget.onLanguageChange)
          ],
        ),
      ],
    );
  }
}
