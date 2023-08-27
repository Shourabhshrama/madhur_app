import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  late SharedPreferences _prefs;

  // Private constructor to ensure a single instance of SessionManager
  SessionManager._privateConstructor();

  // Singleton instance
  static final SessionManager _instance = SessionManager._privateConstructor();

  // Factory constructor to provide the same instance across the app
  factory SessionManager() {
    return _instance;
  }

  // Initialize SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Store a String value
  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  // Retrieve a String value
  String? getString(String key) {
    return _prefs.getString(key);
  }

  // Store a bool value
  Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  // Retrieve a bool value
  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  // Clear a specific key
  Future<void> removeKey(String key) async {
    await _prefs.remove(key);
  }

  // Clear all keys
  Future<void> clear() async {
    await _prefs.clear();
  }
}
