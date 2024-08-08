import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:recipe_app/core/domain/domain.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required MealsRepositoryInterface mealsRepository})
      : _mealsRepository = mealsRepository,
        super(HomeLoadingState()) {
    on<HomeLoadMealsEvent>(_onLoadMeals);
    add(HomeLoadMealsEvent());
  }

  final MealsRepositoryInterface _mealsRepository;

  Future<void> _onLoadMeals(
    HomeLoadMealsEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      if (state is! HomeLoadingState) {
        emit(HomeLoadingState());
      }

      List<Meal> randomMeals = [];
      for (int i = 0; i < 10; i++) {
        final Meal randomMeal = await _mealsRepository.getRandomMeal();
        randomMeals.add(randomMeal);
      }

      emit(HomeLoadedState(randomMeals: randomMeals));
    } catch (exception, stackTrace) {
      print("$exception $stackTrace");
      emit(HomeFailureState(exception: exception));
    }
  }
}
