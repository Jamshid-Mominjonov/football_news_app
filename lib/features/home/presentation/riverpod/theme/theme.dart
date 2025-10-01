import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light) {
    getTheme();
  }

  Future<void> changeTheme() async {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('DarkMode', state == ThemeMode.dark);
  }

  Future<void> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool('DarkMode');
    state = isDark != null && isDark ? state = ThemeMode.dark : state = ThemeMode.light;
  }
}