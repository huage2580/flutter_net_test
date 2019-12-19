
import 'package:dio/dio.dart';
import 'package:flutter_net_test/model/base_response_entity.dart';
import 'package:flutter_net_test/model/test2_bean_entity.dart';
import 'package:retrofit/http.dart';

part 'base.g.dart';

@RestApi(baseUrl: "https://internal-yapi.honglinktech.com/mock/220")
abstract class BaseApi{

  factory BaseApi(Dio dio) = _BaseApi;

  @GET("/index")
  Future<BaseResponseEntity<Test2BeanEntity>> index();

  @GET("/test2")
  Future<BaseResponseEntity<String>> test2();

}