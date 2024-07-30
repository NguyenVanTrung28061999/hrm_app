import 'dart:collection';
import 'dart:io';
import 'package:app_hrm/core/controllers/event_bus/event_bus_controller.dart';
import 'package:app_hrm/core/translation/en_us.dart';
import 'package:app_hrm/core/translation/vi_vn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalizationService extends Translations {
// locale sẽ được get mỗi khi mới mở app (phụ thuộc vào locale hệ thống hoặc bạn có thể cache lại locale mà người dùng đã setting và set nó ở đây)
  static final locale = getLocaleStorage();

// fallbackLocale là locale default nếu locale được set không nằm trong những Locale support
  static final fallbackLocale = Locale('vi', 'VN');

// language code của những locale được support
  static final langCodes = [
    'en',
    'vi',
  ];

// các Locale được support
  static final locales = [
    Locale('en', 'US'),
    Locale('vi', 'VN'),
  ];

// cái này là Map các language được support đi kèm với mã code của lang đó: cái này dùng để đổ data vào Dropdownbutton và set language mà không cần quan tâm tới language của hệ thống
  static final langs = LinkedHashMap.from({
    'en': 'English',
    'vi': 'Tiếng Việt',
  });

// function change language nếu bạn không muốn phụ thuộc vào ngôn ngữ hệ thống
  static void changeLocale(String langCode) {
    final locale = getLocaleFromLanguage(langCode: langCode);
    final box = GetStorage();
    String fullLang = langCode == "vi" ? "vi_VN" : "en_US";
    box.write("lang", fullLang);
    try {
      Get.updateLocale(locale);
      //add event bus
      EventBusController _eventBus = Get.put(EventBusController());
      _eventBus.language(langCode);
    } catch (e) {}
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'vi_VN': vi,
      };

  static Locale getLocaleFromLanguage({String? langCode}) {
    var lang = langCode ?? Get.deviceLocale!.languageCode;
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) return locales[i];
    }
    return Get.locale ?? const Locale("en", "US");
  }

  static Locale getLocaleStorage() {
    final box = GetStorage();
    var langStorage = box.read("lang");
    if (langStorage != null && langStorage != "") {
      return Locale(langStorage.split("_")[0], langStorage.split("_")[1]);
    } else {
      var localLocateStr = Platform.localeName;
      box.write('lang', localLocateStr);
      var _locate = getLocaleFromLanguage(langCode: localLocateStr);
      return _locate;
    }
  }

  static String getStringLangStorage() {
    final box = GetStorage();
    var langStorage = box.read("lang");
    if (langStorage != null && langStorage != "") {
      return langStorage.split("_")[0];
    } else {
      return "vi";
    }
  }

  // static String getLocaleString() {
  //   var _locale = _getLocaleFromLanguage(langCode: HomeController.langCode);
  //   return '${_locale.languageCode}_${_locale.countryCode}';
  // }
}
