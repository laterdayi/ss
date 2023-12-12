part of '../index.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find();

  late final SharedPreferences _prefs;
  SharedPreferences get prefs => _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> clear() async => await _prefs.clear();

  bool containsKey(String key) => _prefs.containsKey(key);

  Object? get(String key) => _prefs.get(key);

  bool? getBool(String key) => _prefs.getBool(key);

  double? getDouble(String key) => _prefs.getDouble(key);

  int? getInt(String key) => _prefs.getInt(key);

  Set<String> getKeys() => _prefs.getKeys();

  String? getString(String key) => _prefs.getString(key);

  List<String>? getStringList(String key) => _prefs.getStringList(key);

  Future<void> reload() async => await _prefs.reload();

  Future<bool> remove(String key) async => await _prefs.remove(key);

  Future<bool> setBool(String key, bool value) async => await _prefs.setBool(key, value);

  Future<bool> setDouble(String key, double value) async => await _prefs.setDouble(key, value);
  
  Future<bool> setInt(String key, int value) async => await _prefs.setInt(key, value);

  Future<bool> setString(String key, String value) async => await _prefs.setString(key, value);

  Future<bool> setStringList(String key, List<String> value) async => await _prefs.setStringList(key, value);
}
