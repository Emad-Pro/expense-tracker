import '../sharedPreferences/cacheHelper.dart';

class LanguageCacheHelper {
  Future<void> setCacheLanguageCode(String localeCode) async {
    await CacheHelper.saveData(key: "LOCALE", value: localeCode);
  }

  Future<String> getCacheLanguageCode() async {
    final cacheLanguageCode = await CacheHelper.getSaveData(key: "LOCALE");
    if (cacheLanguageCode != null) {
      return cacheLanguageCode;
    } else {
      return "en";
    }
  }
}
