import 'dart:ui';

import 'package:getx_clean_architecture/core/utils/local_storage/hive_storage.dart';
import 'package:getx_clean_architecture/core/utils/local_storage/local_db_constants.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/generated/locales.g.dart';

import '../constants.dart';

class LocalizationService extends Translations {
  static final locale = _getLocaleFromLanguage();

  static const fallbackLocale =
      Locale(LanguageCodeConstant.VI, LanguageCountryConstant.VI);

  static final langCodes = [
    LanguageCodeConstant.EN,
    LanguageCodeConstant.VI,
    LanguageCodeConstant.CN
  ];

  static final locales = [
    const Locale(LanguageCodeConstant.EN, LanguageCountryConstant.EN),
    const Locale(LanguageCodeConstant.VI, LanguageCountryConstant.VI),
    const Locale(LanguageCodeConstant.CN, LanguageCountryConstant.CN),
  ];

  static void changeLocale(String langCode) {
    final locale = _getLocaleFromLanguage(langCode: langCode);
    HiveStorage.box.put(LocalDBConstants.LANGUAGE, langCode);
    Get.updateLocale(locale!);
  }

  static Locale? _getLocaleFromLanguage({String? langCode}) {
    String? languageCode =
        HiveStorage.box.get(LocalDBConstants.LANGUAGE) ?? "vi";
    var lang = langCode ?? languageCode;

    HiveStorage.box.put(LocalDBConstants.LANGUAGE, lang);

    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) return locales[i];
    }
    return Get.locale;
  }

  @override
  Map<String, Map<String, String>> get keys => AppTranslation.translations;
}
