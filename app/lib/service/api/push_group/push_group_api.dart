import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'push_group_api.g.dart';

@RestApi()
abstract class PushGroupApi {
  factory PushGroupApi(Dio dio, {String baseUrl}) = _PushGroupApi;

  @GET("/push-groups")
  void test();
}
