import 'package:recipe_app/api/api.dart';
import 'package:recipe_app/core/domain/models/meal.dart';
import 'package:recipe_app/core/domain/repositories/meals_repository_interface.dart';

class MealsRepository implements MealsRepositoryInterface {
  MealsRepository({required RecipeApiClient apiClient})
      : _apiClient = apiClient;

  final RecipeApiClient _apiClient;

  @override
  Future<List<Meal>> getMealsByName(String name) async {
    final Meals meals = await _apiClient.getMealsByName(name);
    return meals.meals ?? [];
  }

  @override
  Future<Meal> getRandomMeal() async {
    final Meals meals = await _apiClient.getRandomMeal();
    return meals.meals!.first;
  }

  @override
  Future<List<Meal>> getMealsByCategory(String category) async {
    final Meals meals = await _apiClient.getMealsByCategory(category);
    return meals.meals ?? [];
  }

  // @override
  // Future<Meal> getBeefCategoryMeal() {

  // }

  // @override
  // Future<Meal> getPastaCategoryMeal() {

  // }
}
