import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService{

  late final GetStorage _box;
  static StorageService get to => Get.find<StorageService>();

  static Future<void> init() async {
    await Get.putAsync<StorageService>(() async {
      final storageService = StorageService();
      await GetStorage.init();
      await storageService.create();
      return storageService;
    }, permanent: true);
  }

  Future<void> create() async {
    _box = GetStorage();
  }

  bool isLoggedIn() {
    String token = getAccessToken();
    return token.isNotEmpty;
  }

  Future<void> setAccessToken(String value) async {
    await _box.write(_StorageKeys.ACCESS_TOKEN, value);
  }

  String getAccessToken() {
    return _box.read(_StorageKeys.ACCESS_TOKEN);
  }

  Future<void> delAccessToken() async {
    await _box.remove(_StorageKeys.ACCESS_TOKEN);
  }

  String getLanguage() {
    return _box.read(_StorageKeys.LANGUAGE);
  }

  Future<void> setLanguage(Locale locale) async {
    await _box.write(_StorageKeys.LANGUAGE, locale.toString());
  }

}

class _StorageKeys {
  static const ACCESS_TOKEN = 'access_token';
  static const LANGUAGE = 'language';
}