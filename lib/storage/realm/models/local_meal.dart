import 'package:realm/realm.dart';

part 'local_meal.realm.dart';

@RealmModel()
class _LocalMeal {
  @PrimaryKey()
  late String id;
  late String name;
  late String area;
  late String category;
  late String instructions;
  late List<String> ingredients;
  late String imageUrl;
}
