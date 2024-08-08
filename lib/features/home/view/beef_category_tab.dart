import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/common/widgets/widgets.dart';
import 'package:recipe_app/features/home/home_bloc/home_bloc.dart';

@RoutePage(name: "BeefCategoryRoute")
class BeefCategoryTab extends StatelessWidget {
  const BeefCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            if (state is HomeLoadedState)
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                sliver: MealsSliverGrid(
                  meals: state.randomMeals,
                ),
              ),
            if (state is HomeLoadingState)
              const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        );
      },
    );
  }
}
