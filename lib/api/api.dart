import 'package:dio/dio.dart';
import 'package:recipe_app/api/models/meal.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://www.themealdb.com/api/json/v1/1/')
abstract class RecipeApiClient {
  factory RecipeApiClient(
    Dio dio, {
    String baseUrl,
  }) = _RecipeApiClient;

  @GET('random.php')
  Future<ApiMeals> getRandomMeal();

  @GET('search.php')
  Future<ApiMeals> getMealsByName(@Query("s") String search);

  @GET('filter.php')
  Future<ApiMeals> getMealsByCategory(@Query("c") String category);

  @GET('lookup.php')
  Future<ApiMeals> getMealDeatilsByID(@Query("i") String id);
}
