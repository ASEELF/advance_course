

import 'package:advanced_course/data/responses/responses.dart';
import 'package:retrofit/error_logger.dart';
import'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import '../../app/constant.dart';
part 'app_api.g.dart';

//the call of the api is happened here using dio , so when we want to handle the error of the response we check if the error from dio in error_handler.dart file
@RestApi(baseUrl: Constant.baseUrl )
abstract class AppServiceClient{
  factory AppServiceClient(
      Dio dio,{String baseUrl})=_AppServiceClient;
@POST("/customers/login")
  Future<AuthenticationResponse>login(
    @Field("email") String email,
    @Field("password") String password,
    @Field("imei") String imei,
    @Field("deviceType") String deviceType,




    );

}