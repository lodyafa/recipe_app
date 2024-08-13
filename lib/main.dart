import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:recipe_app/app/app.dart';
import 'package:recipe_app/storage/realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dio = Dio();
  final prefs = await SharedPreferences.getInstance();
  final realm = Realm(
    Configuration.local(
      [LocalMeal.schema],
      shouldDeleteIfMigrationNeeded: true,
    ),
  );

  final AppConfig config = AppConfig(
    prefs: prefs,
    dio: dio,
    realm: realm,
  );

  runApp(RecipeApp(appConfig: config));
}
