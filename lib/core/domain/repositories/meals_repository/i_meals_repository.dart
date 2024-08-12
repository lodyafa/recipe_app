
import 'package:recipe_app/core/domain/domain.dart';

abstract interface class MealsRepositoryInterface {
  Future<List<Meal>> getMealsByName(String name);
  Future<Meal> getRandomMeal();
  Future<List<Meal>> getMealsByCategory(String category);
  Future<Meal> getMealDeatilsByID(String id);
}
