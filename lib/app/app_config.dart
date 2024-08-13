import 'package:dio/dio.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfig {
  final SharedPreferences prefs;
  final Dio dio;
  final Realm realm;

  AppConfig({
    required this.prefs,
    required this.dio,
    required this.realm,
  });
}
