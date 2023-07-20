import 'package:get/get.dart';

import 'ar.dart';
import 'en.dart';


class AppLanguage extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {
        'ar': ar,
        'en': en
      };
}
