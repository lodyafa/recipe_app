import 'package:dio/dio.dart';
import 'package:recipe_app/core/domain/models/meal.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://www.themealdb.com/api/json/v1/1/')
abstract class RecipeApiClient {
  factory RecipeApiClient(Dio dio, {String baseUrl}) = _RecipeApiClient;

  @GET('search.php')
  Future<Meals> getMealsByName(@Query("s") String search);
}
