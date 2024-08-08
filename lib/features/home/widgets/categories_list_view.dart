import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    // _scrollController.addListener(() {
    //   if (_scrollController.offset > 0) {

    //     setState(() {});
    //   } else if (_scrollController.offset == 0) {
    //     setState(() {});
    //   }
    // });
  }

  bool _removePadding() {
    return _scrollController.hasClients && _scrollController.offset > 0;
  }

  @override
  Widget build(BuildContext context) {
    final int curIndex = widget.tabController.index;

    final theme = Theme.of(context);
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
              onTap: () => widget.tabController.animateTo(index),
              child: Container(
                alignment: Alignment.center,
                width: 110,
                decoration: BoxDecoration(
                    color: curIndex == index ? Colors.red : theme.primaryColor,
                    borderRadius: BorderRadius.circular(16)),
                child: const Text("Chicken"),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: 5,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
