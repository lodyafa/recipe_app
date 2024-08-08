part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {}

final class SearchMealEvent extends SearchEvent {
  final String query;

  SearchMealEvent(this.query);

  @override
  List<Object?> get props => [query];
}
