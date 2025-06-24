import 'package:base_flutter/translations/en_US/en_us_translations.dart';
import 'package:base_flutter/translations/vi_VN/vi_vn_translations.dart';
import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enUs,
        'vi': viVn,
      };
}
