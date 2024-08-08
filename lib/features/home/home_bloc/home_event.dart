part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {}

final class HomeLoadMealsEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
