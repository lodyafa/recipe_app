import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfig {
  final SharedPreferences prefs;
  final Dio dio;

  AppConfig({
    required this.prefs,
    required this.dio,
  });
}
