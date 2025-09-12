import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:football_news_app/features/home/domain/entities/favourites_entity.dart';
import 'package:hive_flutter/adapters.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/home/data/data_sources/local/hive_local_data_source.dart';
import 'firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FavouritesEntityAdapter());
  await Hive.openBox<Favourites>("FavouritesBox");
  final hiveLocalDataSource = HiveLocalDataSourceImpl();
  hiveLocalDataSource.box;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: [
          Locale('en', 'US'), 
          Locale('ru', 'RU'),
          Locale('uz', 'UZ')],
        path:
            'assets/translations',
        fallbackLocale: Locale('en', 'US'),
        startLocale: Locale('en', 'US'),
        child: (const MyApp()),
      ),
    ),
  );
}
