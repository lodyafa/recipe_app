import 'package:recipe_app/core/domain/domain.dart';

abstract interface class FavoritesRepositoryInterface {
  Future<List<Meal>> getFavoritesMeals();
  Future<void> addOrRemoveFavoriteMeal(Meal meal);
  Future<void> deleteAllFavorites();
  Future<bool> isFavorite(String mealId);
}
