import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/common/widgets/widgets.dart';
import 'package:recipe_app/features/search/search_bloc/search_bloc.dart';
import 'package:recipe_app/uikit/colors/colors.dart';

@RoutePage(name: "SearchShellRoute")
class SearchShellScreen extends AutoRouter {
  const SearchShellScreen({super.key});
}

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            title: Text(
              "Search",
              style: TextStyle(
                color: colorScheme.onBackground,
              ),
            ),
            surfaceTintColor: Colors.transparent,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(72),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search",
                    hintStyle: TextStyle(color: colorScheme.secondary),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onChanged: (value) {
                    context.read<SearchBloc>().add(SearchMealEvent(value));
                  },
                ),
              ),
            ),
          ),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchInitialState) {
                return const SearchInfoText(
                  text: "Search something...",
                );
              }
              if (state is SearchLoadedState) {
                if (state.meals.isEmpty) {
                  return const SearchInfoText(
                    text: "Ooops, nothing found...",
                  );
                }
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: MealsSliverList(
                    meals: state.meals,
                  ),
                );
              }
              return SliverToBoxAdapter(
                child: Animate(
                  effects: const [
                    FadeEffect(
                      duration: Duration(milliseconds: 400),
                    ),
                  ],
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SearchInfoText extends StatelessWidget {
  const SearchInfoText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    return SliverToBoxAdapter(
      child: Animate(
        key: ValueKey(text),
        effects: const [
          FadeEffect(
            duration: Duration(milliseconds: 400),
          ),
        ],
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: colorScheme.onBackground,
            ),
          ),
        ),
      ),
    );
  }
}
