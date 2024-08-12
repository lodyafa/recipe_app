import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/app/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dio = Dio();
  final prefs = await SharedPreferences.getInstance();

  final AppConfig config = AppConfig(
    prefs: prefs,
    dio: dio,
  );

  runApp(RecipeApp(config: config));
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({
    super.key,
    required this.config,
  });

  final AppConfig config;

  @override
  Widget build(BuildContext context) {
    return RecipeApp(config: config);
  }
}
