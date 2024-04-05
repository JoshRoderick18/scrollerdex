import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferences? _prefs;
  final String _key = "savedPokemons";

  SharedPreferencesService._internal();

  factory SharedPreferencesService() {
    return SharedPreferencesService._internal();
  }

  Future<SharedPreferences?> get _initializePrefs async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs;
  }

  Future<List<String>> getSavedPokemons() async {
    var pref = await _initializePrefs;
    return pref?.getStringList(_key) ?? [];
  }

  Future<void> setSavedPokemons(List<String> value) async {
    var pref = await _initializePrefs;
    await pref?.setStringList(_key, value);
  }
}
