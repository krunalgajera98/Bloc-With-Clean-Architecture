import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences prefsData;

  static Future initMySharedPreferences() async {
    prefsData = await SharedPreferences.getInstance();
  }

  /// for saving themeMode
  static Future<void> saveToken(String token) async {
    await prefsData.setString("token", token);
  }

  static Future<String> getToken() async {
    return prefsData.getString("token") ?? '';
  }
}
