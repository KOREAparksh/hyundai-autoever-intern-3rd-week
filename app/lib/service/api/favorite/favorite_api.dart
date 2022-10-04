import 'package:app/dto/favorite_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'favorite_api.g.dart';

@RestApi()
abstract class FavoriteApi {
  factory FavoriteApi(Dio dio, {String baseUrl}) = _FavoriteApi;

  @GET("/favorite")
  Future<HttpResponse<List<FavoriteDto>>> getFavoriteScreen(
      @Query("user_id") String userId);
}
