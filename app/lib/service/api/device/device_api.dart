import 'package:app/dto/device_dto/device_dto.dart';
import 'package:app/dto/favorite_dto/favorite_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'device_api.g.dart';

@RestApi()
abstract class DeviceApi {
  factory DeviceApi(Dio dio, {String baseUrl}) = _DeviceApi;

  @GET("/devices")
  Future<HttpResponse<List<DeviceDto>>> getAllDevice();

  @POST("/devices")
  Future<HttpResponse<String>> postDevice(@Body() DeviceDto dto);
}
