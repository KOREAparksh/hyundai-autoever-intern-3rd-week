import 'package:app/dto/push_history/push_history_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'push_history_api.g.dart';

@RestApi()
abstract class PushHistoryApi {
  factory PushHistoryApi(Dio dio, {String baseUrl}) = _PushHistoryApi;

  @GET("/push-message-histories")
  Future<HttpResponse<List<PushHistoryDto>>> getPushHistory();
}
