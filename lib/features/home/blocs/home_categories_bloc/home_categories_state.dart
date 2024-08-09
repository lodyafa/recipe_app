part of 'home_categories_bloc.dart';

sealed class HomeCategoriesState extends Equatable {}

final class HomeCategoriesInitialState extends HomeCategoriesState {
  @override
  List<Object?> get props => [];
}

final class HomeCategoriesLoadingState extends HomeCategoriesState {
  HomeCategoriesLoadingState({required this.loadingCategory});

  final MealCategory loadingCategory;

  @override
  List<Object?> get props => [loadingCategory];
}

final class HomeCategoriesLoadedState extends HomeCategoriesState {
  HomeCategoriesLoadedState({
    this.beefCategoryMeals = const [],
    this.chickenCategoryMeals = const [],
    this.dessertCategoryMeals = const [],
  });

  final List<Meal> beefCategoryMeals;
  final List<Meal> chickenCategoryMeals;
  final List<Meal> dessertCategoryMeals;

  HomeCategoriesLoadedState copyWith({
    List<Meal>? beefCategoryMeals,
    List<Meal>? chickenCategoryMeals,
    List<Meal>? dessertCategoryMeals,
  }) {
    return HomeCategoriesLoadedState(
      beefCategoryMeals: beefCategoryMeals ?? this.beefCategoryMeals,
      chickenCategoryMeals: chickenCategoryMeals ?? this.chickenCategoryMeals,
      dessertCategoryMeals: dessertCategoryMeals ?? this.dessertCategoryMeals,
    );
  }

  @override
  List<Object?> get props => [
        beefCategoryMeals,
        chickenCategoryMeals,
        dessertCategoryMeals,
      ];
}

final class HomeCategoriesFailureState extends HomeCategoriesState {
  HomeCategoriesFailureState({required this.exception});

  final Object exception;

  @override
  List<Object?> get props => [exception];
}
