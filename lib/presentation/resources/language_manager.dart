// ignore_for_file: constant_identifier_names

const String ENGLISH = "en";
const String ARABIC = "ar";

enum LanguageType { ENGLISH, ARABIC }

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;

      case LanguageType.ARABIC:
        return ARABIC;
    }
  }
}
