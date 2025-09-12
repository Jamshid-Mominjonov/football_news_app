import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefLocalDataSource {
  Future<void> toggleDarkMode (bool val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('DarkMode', val);
  }

  Future<void> saveTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getBool('DarkMode');
  }
}