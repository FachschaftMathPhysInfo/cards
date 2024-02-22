import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

class Flag extends StatelessWidget {
  final String? languageCode;
  const Flag({super.key, this.languageCode});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25,
      child:
          CountryFlag.fromLanguageCode(languageCode ?? "de", borderRadius: 8),
    );
  }
}
