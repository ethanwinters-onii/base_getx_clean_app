import 'dart:io';

import 'package:getx_clean_architecture/core/utils/local_storage/local_db_constants.dart';
// import 'package:pvoil4u/app/core/utils/local_storage/local_storage.dart';
import 'package:intl/intl.dart';

import '../local_storage/hive_storage.dart';

extension StringExtension on String {
  // to currency type, for vi_sample: 50.000, en_sample: 50,000
  String toCurrencyFromLocale() {
    String? langCode = HiveStorage.box.get(LocalDBConstants.LANGUAGE) ??
        Intl.shortLocale(Platform.localeName);
    if (isEmpty) {
      return "";
    } else {
      try {
        return NumberFormat.decimalPattern(langCode).format(int.parse(this));
      } catch (e) {
        return "";
      }
    }
  }

  // to DateTime datatype, sample: "2023-05-30 06:25:58.0"
  DateTime toDateTime() {
    return DateFormat("yyyy-MM-dd HH:mm:ss").parse(this);
  }
}
