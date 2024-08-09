part of 'home_categories_bloc.dart';

sealed class HomeCategoriesEvent extends Equatable {}

final class HomeLoadCategoryEvent extends HomeCategoriesEvent {
  HomeLoadCategoryEvent({required this.category});

  final MealCategory category;

  @override
  List<Object?> get props => [category];
}
