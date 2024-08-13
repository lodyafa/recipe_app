import 'package:equatable/equatable.dart';
import 'package:realm/realm.dart';
import 'package:recipe_app/api/models/models.dart';
import 'package:recipe_app/storage/realm/realm.dart';

class Meal extends Equatable {
  final String id;
  final String name;
  final String area;
  final String category;
  final String instructions;
  final List<String> ingredients;
  final String imageUrl;
  final bool isFavorite;

  const Meal({
    required this.id,
    required this.name,
    required this.area,
    required this.category,
    required this.instructions,
    required this.ingredients,
    required this.imageUrl,
    required this.isFavorite,
  });

  static const _defaultImageUrl =
      "https://w7.pngwing.com/pngs/29/173/png-transparent-null-pointer-symbol-computer-icons-pi-miscellaneous-angle-trademark.png";

  ApiMeal toApi() {
    return ApiMeal(
      idMeal: id,
      strMeal: name,
      strCategory: category,
      strArea: area,
      strIngredient1: ingredients[0],
      strIngredient2: ingredients[1],
      strIngredient3: ingredients[2],
      strIngredient4: ingredients[3],
      strIngredient5: ingredients[4],
      strIngredient6: ingredients[5],
      strIngredient7: ingredients[6],
      strIngredient8: ingredients[7],
      strIngredient9: ingredients[8],
      strIngredient10: ingredients[9],
      strIngredient11: ingredients[10],
      strIngredient12: ingredients[11],
      strIngredient13: ingredients[12],
      strIngredient14: ingredients[13],
      strIngredient15: ingredients[14],
      strIngredient16: ingredients[15],
      strIngredient17: ingredients[16],
      strIngredient18: ingredients[17],
      strIngredient19: ingredients[18],
      strIngredient20: ingredients[19],
      strMealThumb: imageUrl,
      strInstructions: instructions,
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
      apiMeal.strIngredient10 ?? "",
      apiMeal.strIngredient11 ?? "",
      apiMeal.strIngredient12 ?? "",
      apiMeal.strIngredient13 ?? "",
      apiMeal.strIngredient14 ?? "",
      apiMeal.strIngredient15 ?? "",
      apiMeal.strIngredient16 ?? "",
      apiMeal.strIngredient17 ?? "",
      apiMeal.strIngredient18 ?? "",
      apiMeal.strIngredient19 ?? "",
      apiMeal.strIngredient20 ?? "",
    ];

    return Meal(
      id: apiMeal.idMeal ?? Uuid.v4().toString(),
      name: apiMeal.strMeal ?? "Unknown meal",
      area: apiMeal.strArea ?? "Unknown area",
      category: apiMeal.strCategory ?? "Unknown category",
      instructions: apiMeal.strInstructions ?? "Unknown",
      ingredients: ingredients,
      imageUrl: apiMeal.strMealThumb ?? _defaultImageUrl,
      isFavorite: false,
    );
  }

  LocalMeal toLocal() => LocalMeal(
        id,
        name,
        area,
        category,
        instructions,
        imageUrl,
      );

  factory Meal.fromLocal(LocalMeal localMeal) {
    return Meal(
      id: localMeal.id,
      name: localMeal.name,
      area: localMeal.area,
      category: localMeal.category,
      instructions: localMeal.instructions,
      ingredients: localMeal.ingredients,
      imageUrl: localMeal.imageUrl,
      isFavorite: true,
    );
  }

  @override
  List<Object?> get props => [
        name,
        area,
        category,
        instructions,
        ingredients,
        imageUrl,
      ];

  Meal copyWith({
    String? id,
    String? name,
    String? area,
    String? category,
    String? instructions,
    List<String>? ingredients,
    String? imageUrl,
    bool? isFavorite,
  }) {
    return Meal(
      id: id ?? this.id,
      name: name ?? this.name,
      area: area ?? this.area,
      category: category ?? this.category,
      instructions: instructions ?? this.instructions,
      ingredients: ingredients ?? this.ingredients,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
