import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/domain/domain.dart';
import 'package:recipe_app/features/home/home.dart';
import 'package:recipe_app/uikit/colors/colors.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  late final ScrollController _scrollController;

  static const _categories = [
    "Beef",
    "Chicken",
    "Dessert",
    "Lamb",
    "Miscellaneous",
    "Pasta",
    "Pork",
    "Seafood",
    "Side",
    "Starter",
    "Vegan",
    "Vegetarian",
    "Breakfast",
    "Goat"
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    widget.tabController.addListener(_listenToTabScroll);
  }

  void _listenToTabScroll() {
    // final tabController = widget.tabController;

    // if (tabController.index == 0) return;

    // BlocProvider.of<HomeCategoriesBloc>(context).add(
    //   HomeLoadCategoryEvent(
    //     category: MealCategory.fromString(
    //       _categories[tabController.index],
    //     ),
    //   ),
    // );
  }

  bool _removePadding() {
    return _scrollController.hasClients && _scrollController.offset > 0;
  }

  @override
  Widget build(BuildContext context) {
    final int curIndex = widget.tabController.index;
    final colorScheme = AppColorScheme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        left: _removePadding() ? 0 : 16,
      ),
      child: SizedBox(
        height: 40,
        child: ListView.separated(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _onCategoryPressed(index),
              child: Container(
                alignment: Alignment.center,
                width: 110,
                decoration: BoxDecoration(
                  color: curIndex == index
                      ? colorScheme.primary
                      : colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  _categories[index],
                  style: TextStyle(
                    color: curIndex == index
                        ? colorScheme.background
                        : colorScheme.onBackground,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: _categories.length,
        ),
      ),
    );
  }

  void _onCategoryPressed(int index) {
    BlocProvider.of<HomeCategoriesBloc>(context).add(
      HomeLoadCategoryEvent(
        category: MealCategory.fromString(
          _categories[index],
        ),
      ),
    );
    widget.tabController.animateTo(index);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    widget.tabController.removeListener(_listenToTabScroll);
    super.dispose();
  }
}
