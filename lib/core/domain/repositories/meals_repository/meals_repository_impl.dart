import 'package:recipe_app/api/api.dart';
import 'package:recipe_app/api/models/meal.dart';
import 'package:recipe_app/core/domain/domain.dart';

class MealsRepository implements MealsRepositoryInterface {
  MealsRepository({required RecipeApiClient apiClient})
      : _apiClient = apiClient;

  final RecipeApiClient _apiClient;

  @override
  Future<List<Meal>> getMealsByName(String name) async {
    final ApiMeals meals = await _apiClient.getMealsByName(name);
    final apiMeals = meals.meals;
    return _convertApiMeals(apiMeals ?? []);
  }

  @override
  Future<Meal> getRandomMeal() async {
    final ApiMeals meals = await _apiClient.getRandomMeal();
    final apiMeal = meals.meals!.first;
    return Meal.fromApi(apiMeal);
  }

  @override
  Future<List<Meal>> getMealsByCategory(String category) async {
    final ApiMeals meals = await _apiClient.getMealsByCategory(category);
    final apiMeals = meals.meals;
    return _convertApiMeals(apiMeals ?? []);
  }

  @override
  Future<Meal> getMealDeatilsByID(String id) async {
    final ApiMeals meals = await _apiClient.getMealDeatilsByID(id);
    final apiMeal = meals.meals!.first;
    return Meal.fromApi(apiMeal);
  }

  List<Meal> _convertApiMeals(List<ApiMeal> apiMeals) {
    List<Meal> convertedMeals = [];
    for (int i = 0; i < apiMeals.length; i++) {
      convertedMeals.add(Meal.fromApi(apiMeals[i]));
    }
    return convertedMeals;
  }

  // @override
  // Future<Meal> getBeefCategoryMeal() {

  // }

  // @override
  // Future<Meal> getPastaCategoryMeal() {

  // }
}
