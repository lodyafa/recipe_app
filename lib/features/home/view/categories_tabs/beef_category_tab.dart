import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/common/widgets/widgets.dart';
import 'package:recipe_app/core/domain/domain.dart';
import 'package:recipe_app/features/home/home.dart';

@RoutePage(name: "BeefCategoryRoute")
class BeefCategoryTab extends StatelessWidget {
  const BeefCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCategoriesBloc, HomeCategoriesState>(
      buildWhen: (previous, current) {
        bool statement = ((current is HomeCategoriesLoadingState &&
                current.loadingCategory == MealCategory.beef) ||
            (current is HomeCategoriesLoadedState &&
                current.curLoadedCategory == MealCategory.beef));

        return statement;
      },
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            if (state is HomeCategoriesLoadedState)
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                sliver: MealsSliverGrid(
                  meals: state.beefCategoryMeals,
                ),
              ),
            if (state is HomeCategoriesLoadingState)
              const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            if (state is HomeCategoriesFailureState)
              const SliverToBoxAdapter(
                child: Center(child: Text("Error")),
              ),
          ],
        );
      },
    );
  }
}
