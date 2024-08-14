import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/domain/domain.dart';
import 'package:recipe_app/core/router/router.dart';
import 'package:recipe_app/features/recipe/recipe.dart';
import 'package:recipe_app/uikit/uikit.dart';

class MealsSliverList extends StatelessWidget {
  const MealsSliverList({
    super.key,
    required this.meals,
  });

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        final meal = meals[index];
        return Animate(
          effects: const [
            FadeEffect(
              duration: Duration(milliseconds: 400),
            ),
          ],
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<RecipeBloc>(context)
                  .add(RecipeLoadEvent(meal.id));
              AutoRouter.of(context).push(RecipeRoute(meal: meal));
            },
            child: MealListCard(
              meal: meals[index],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: meals.length,
    );
  }
}
