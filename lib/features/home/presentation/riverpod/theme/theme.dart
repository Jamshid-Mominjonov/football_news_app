import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_news_app/features/home/data/data_sources/local/shar_pr_local_data_source.dart';
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

// class ThemeNotifier extends StateNotifier<ThemeMode> {
//   final SharedPrefLocalDataSource localDataSource;
//
//   ThemeNotifier(this.localDataSource) : super(ThemeMode.light);
//
//   Future<void> saveTheme() async {
//     final isDark = await localDataSource.saveTheme();
//     state = isDark ? ThemeMode.light : ThemeMode.dark;
//   }
//
//   Future<void> changeTheme() async {
//     if (state == ThemeMode.dark) {
//       state == ThemeMode.light;
//       await localDataSource.toggleDarkMode(true);
//     } else {
//       state == ThemeMode.light;
//       await localDataSource.toggleDarkMode(false)
//     }
//   }
// }