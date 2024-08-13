import 'package:realm/realm.dart';
import 'package:recipe_app/core/domain/domain.dart';
import 'package:recipe_app/storage/realm/models/local_meal.dart';

class FavoritesRepository implements FavoritesRepositoryInterface {
  final Realm _realm;

  FavoritesRepository({required Realm realm}) : _realm = realm;

  @override
  Future<List<Meal>> getFavoritesMeals() async {
    final List<LocalMeal> localMeals = _realm.all<LocalMeal>().toList();
    return _convertToMeals(localMeals);
  }

  @override
  Future<void> addOrRemoveFavoriteMeal(Meal meal) async {
    final LocalMeal? localMeal = _realm
        .query<LocalMeal>(
          "id == '${meal.id}' ",
        )
        .firstOrNull;

    if (localMeal == null) {
      final localMeal = meal.toLocal();
      _realm.write(() => _realm.add<LocalMeal>(localMeal));
      return;
    }

    _realm.write(() => _realm.delete<LocalMeal>(localMeal));
  }

  @override
  Future<void> deleteAllFavorites() async {
    _realm.write(() => _realm.deleteAll<LocalMeal>());
  }

  @override
  Future<bool> isFavorite(String mealId) async {
    final LocalMeal? localMeal = _realm
        .query<LocalMeal>(
          "id == '$mealId' ",
        )
        .firstOrNull;

    if (localMeal == null) return false;
    return true;
  }

  List<Meal> _convertToMeals(List<LocalMeal> localMeals) {
    List<Meal> meals = [];
    for (int i = 0; i < localMeals.length; i++) {
      meals.add(Meal.fromLocal(localMeals[i]));
    }
    return meals;
  }
}
