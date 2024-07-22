import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/api/api.dart';
import 'package:recipe_app/core/router/router.dart';
import 'package:recipe_app/core/domain/models/meal.dart';

void main() async {
  final dio = Dio();
  final apiClient = RecipeApiClient(dio);
  try {
    final Meals response = await apiClient.getMealsByName('burger');
    final List<Meal> meals = response.meals!;
    for (Meal meal in meals) {
      print(meal.strArea);
    }
  } catch (e) {
    print('Error: $e');
  }
  runApp(RecipeApp());
}

class RecipeApp extends StatefulWidget {
  const RecipeApp({super.key});

  @override
  State<RecipeApp> createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Recipe App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router.config(),
    );
  }
}
