import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferences? _prefs;

  SharedPreferencesService._internal();

  factory SharedPreferencesService() {
    return SharedPreferencesService._internal();
  }

  Future<SharedPreferences?> get _initializePrefs async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs;
  }

  Future<String> getString(String key) async {
    var pref = await _initializePrefs;
    return pref?.getString(key) ?? "";
  }

  Future<void> setStringList(String key, List<String> value) async {
    var pref = await _initializePrefs;
    await pref?.setStringList(key, value);
  }
}
