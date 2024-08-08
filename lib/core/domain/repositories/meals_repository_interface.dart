import 'package:recipe_app/core/domain/models/models.dart';

abstract interface class MealsRepositoryInterface {
  Future<List<Meal>> getMealsByName(String name);
  Future<Meal> getRandomMeal();
  
}
