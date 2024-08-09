enum MealCategory {
  beef,
  chicken,
  dessert,
  lamb,
  miscellaneous,
  pasta,
  pork,
  seafood,
  side,
  starter,
  vegan,
  vegetarian,
  breakfast,
  goat;

  @override
  String toString() {
    switch (this) {
      case MealCategory.beef:
        return "Beef";
      case MealCategory.chicken:
        return "Chicken";
      case MealCategory.dessert:
        return "Dessert";
      case MealCategory.lamb:
        return "Lamb";
      case MealCategory.miscellaneous:
        return "Miscellaneous";
      case MealCategory.pasta:
        return "Pasta";
      case MealCategory.pork:
        return "Pork";
      case MealCategory.seafood:
        return "Seafood";
      case MealCategory.side:
        return "Side";
      case MealCategory.starter:
        return "Starter";
      case MealCategory.vegan:
        return "Vegan";
      case MealCategory.vegetarian:
        return "Vegetarian";
      case MealCategory.breakfast:
        return "Breakfast";
      case MealCategory.goat:
        return "Goat";
      default:
        return "";
    }
  }

  static MealCategory fromString(String value) {
    return MealCategory.values.firstWhere(
      (element) => element.toString().toLowerCase() == value.toLowerCase(),
      orElse: () => MealCategory.beef,
    );
  }
}
