import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static const _usernameKey = "username";
  static const _notificationKey = "notification";

  Future<void> saveUsername(String username) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(_usernameKey, username);
  }

  Future<String> getUsername() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(_usernameKey) ?? "Ramzi";
  }

  Future<void> saveNotification(bool value) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(_notificationKey, value);
  }

  Future<bool> getNotification() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(_notificationKey) ?? true;
  }
}