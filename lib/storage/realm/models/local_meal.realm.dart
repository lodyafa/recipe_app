// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_meal.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class LocalMeal extends _LocalMeal
    with RealmEntity, RealmObjectBase, RealmObject {
  LocalMeal(
    String id,
    String name,
    String area,
    String category,
    String instructions,
    String imageUrl, {
    Iterable<String> ingredients = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'area', area);
    RealmObjectBase.set(this, 'category', category);
    RealmObjectBase.set(this, 'instructions', instructions);
    RealmObjectBase.set<RealmList<String>>(
        this, 'ingredients', RealmList<String>(ingredients));
    RealmObjectBase.set(this, 'imageUrl', imageUrl);
  }

  LocalMeal._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get area => RealmObjectBase.get<String>(this, 'area') as String;
  @override
  set area(String value) => RealmObjectBase.set(this, 'area', value);

  @override
  String get category =>
      RealmObjectBase.get<String>(this, 'category') as String;
  @override
  set category(String value) => RealmObjectBase.set(this, 'category', value);

  @override
  String get instructions =>
      RealmObjectBase.get<String>(this, 'instructions') as String;
  @override
  set instructions(String value) =>
      RealmObjectBase.set(this, 'instructions', value);

  @override
  RealmList<String> get ingredients =>
      RealmObjectBase.get<String>(this, 'ingredients') as RealmList<String>;
  @override
  set ingredients(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  String get imageUrl =>
      RealmObjectBase.get<String>(this, 'imageUrl') as String;
  @override
  set imageUrl(String value) => RealmObjectBase.set(this, 'imageUrl', value);

  @override
  Stream<RealmObjectChanges<LocalMeal>> get changes =>
      RealmObjectBase.getChanges<LocalMeal>(this);

  @override
  Stream<RealmObjectChanges<LocalMeal>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<LocalMeal>(this, keyPaths);

  @override
  LocalMeal freeze() => RealmObjectBase.freezeObject<LocalMeal>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'area': area.toEJson(),
      'category': category.toEJson(),
      'instructions': instructions.toEJson(),
      'ingredients': ingredients.toEJson(),
      'imageUrl': imageUrl.toEJson(),
    };
  }

  static EJsonValue _toEJson(LocalMeal value) => value.toEJson();
  static LocalMeal _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
        'area': EJsonValue area,
        'category': EJsonValue category,
        'instructions': EJsonValue instructions,
        'ingredients': EJsonValue ingredients,
        'imageUrl': EJsonValue imageUrl,
      } =>
        LocalMeal(
          fromEJson(id),
          fromEJson(name),
          fromEJson(area),
          fromEJson(category),
          fromEJson(instructions),
          fromEJson(imageUrl),
          ingredients: fromEJson(ingredients),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(LocalMeal._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, LocalMeal, 'LocalMeal', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('area', RealmPropertyType.string),
      SchemaProperty('category', RealmPropertyType.string),
      SchemaProperty('instructions', RealmPropertyType.string),
      SchemaProperty('ingredients', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('imageUrl', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
