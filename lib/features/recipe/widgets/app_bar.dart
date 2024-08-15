import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/domain/domain.dart';
import 'package:recipe_app/features/favorites/favorites.dart';
import 'package:recipe_app/uikit/uikit.dart';

class RecipeDetailsAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  const RecipeDetailsAppBar({
    super.key,
    required this.meal,
    required this.scrollController,
  });

  final Meal meal;
  final ScrollController scrollController;

  @override
  State<RecipeDetailsAppBar> createState() => _RecipeDetailsAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _RecipeDetailsAppBarState extends State<RecipeDetailsAppBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 120,
      ),
    );

    _opacityAnimation =
        Tween<double>(begin: 1, end: 0).animate(_animationController);
    widget.scrollController.addListener(_listenToBodyScroll);
  }

  void _listenToBodyScroll() {
    final scrollController = widget.scrollController;

    if (scrollController.offset > 20) {
      _animationController.forward();
    } else if (scrollController.offset < 20) {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return AnimatedBuilder(
      animation: _opacityAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: child,
        );
      },
      child: AppBar(
        elevation: 0,
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            AutoRouter.of(context).popForced();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: colorScheme.onBackground,
          ),
        ),
        actions: [
          BlocBuilder<FavoritesBloc, FavoritesState>(
            buildWhen: (previous, current) {
              return (current is FavoritesLoadedState);
            },
            builder: (context, state) {
              bool isFavorite = false;
              if (state is FavoritesLoadedState) {
                for (var favMeal in state.favoriteMeals) {
                  if (widget.meal.id == favMeal.id) {
                    isFavorite = true;
                  }
                }
              }
              return Animate(
                key: ValueKey(isFavorite),
                effects: const [FadeEffect(), ShakeEffect()],
                child: IconButton(
                  onPressed: () => _addOrRemoveFromFavorites(context),
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite
                        ? colorScheme.primary
                        : colorScheme.onBackground,
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }

  void _addOrRemoveFromFavorites(BuildContext context) {
    BlocProvider.of<FavoritesBloc>(context)
        .add(AddOrRemoveFromFavoritesEvent(meal: widget.meal));
  }

  @override
  void dispose() {
    _animationController.dispose();
    widget.scrollController.removeListener(_listenToBodyScroll);
    super.dispose();
  }
}
