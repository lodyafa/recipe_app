import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/domain/domain.dart';
import 'package:recipe_app/features/recipe/recipe.dart';

@RoutePage()
class RecipeScreen extends StatefulWidget {
  const RecipeScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    // final colorScheme = AppColorScheme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: RecipeDetailsAppBar(
        meal: widget.meal,
        scrollController: _scrollController,
      ),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          if (state is RecipeLoadedState) {
            return RecipeDetailsBody(
              meal: state.meal,
              scrollController: _scrollController,
            );
          }
          if (state is RecipeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is RecipeFailureState) {
            return const Center(
              child: Text("Something went wrong..."),
            );
          }
          return const Center(
            child: Text("Recipe not found"),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
