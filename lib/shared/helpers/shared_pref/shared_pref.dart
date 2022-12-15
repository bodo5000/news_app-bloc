import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static SharedPreferences? sharedPreferences;

  static Future setupShared() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setDarkModeData({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences!.setBool(key, value);
  }

  static bool? getDarkModeData({
    required String key,
  }) {
    return sharedPreferences!.getBool(key);
  }
}
