import 'package:app/dto/push_group_dto/push_group_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'push_group_api.g.dart';

@RestApi()
abstract class PushGroupApi {
  factory PushGroupApi(Dio dio, {String baseUrl}) = _PushGroupApi;

  @GET("/push-groups")
  Future<HttpResponse<List<PushGroupDto>>> getPushGroup(
      @Query("user_id") String userId);

  @PUT("/push-groups")
  Future<HttpResponse<String>> updatePushGroup(@Query("user_id") String userId,
      @Query("group_id_list") List<String> list);
}
