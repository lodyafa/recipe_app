import 'package:realm/realm.dart';
import 'package:recipe_app/api/models/models.dart';

class Meal {
  final String id;
  final String name;
  final String area;
  final String category;
  final String description;
  final List<String> ingredients;
  final String imageUrl;

  Meal({
    required this.id,
    required this.name,
    required this.area,
    required this.category,
    required this.description,
    required this.ingredients,
    required this.imageUrl,
  });

  ApiMeal toApi() {
    return ApiMeal(
      idMeal: id,
      strMeal: name,
      strCategory: category,
      strArea: area,
      strIngredient1: ingredients[0],
      strIngredient2: ingredients[1],
      strIngredient3: ingredients[2],
      strMealThumb: imageUrl,
    );
  }

  factory Meal.fromApi(ApiMeal apiMeal) {
    List<String> ingredients = [
      apiMeal.strIngredient1 ?? "",
      apiMeal.strIngredient2 ?? "",
      apiMeal.strIngredient3 ?? "",
      apiMeal.strIngredient4 ?? "",
      apiMeal.strIngredient5 ?? "",
      apiMeal.strIngredient6 ?? "",
      apiMeal.strIngredient7 ?? "",
      apiMeal.strIngredient8 ?? "",
      apiMeal.strIngredient9 ?? "",
    ];

    return Meal(
      id: apiMeal.idMeal ?? Uuid.v4().toString(),
      name: apiMeal.strMeal ?? "Unknown",
      area: apiMeal.strArea ?? "Unknown area",
      category: apiMeal.strCategory ?? "Unknown category",
      description: apiMeal.strIngredient1 ?? "Unknown",
      ingredients: ingredients,
      imageUrl: apiMeal.strMealThumb ?? _defaultImageUrl,
    );
  }

  static const _defaultImageUrl =
      "https://www.bahroma1.ru/templates/bahroma1/img/slider/2300x1500_61b11ccbd3b30.jpg";
}
