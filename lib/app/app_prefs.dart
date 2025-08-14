// ignore_for_file: prefer_final_fields, constant_identifier_names, body_might_complete_normally_nullable

import 'package:advanced_flutter_tutorial/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";

class AppPrefs {
  SharedPreferences _sharedPreferences;
  AppPrefs(this._sharedPreferences);

  Future<String?> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      LanguageType.ENGLISH.getValue();
    }
  }
}
