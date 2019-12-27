import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_net_test/api/ApiException.dart';
import 'package:flutter_net_test/api/base.dart';
import 'package:flutter_net_test/model/base_response_entity.dart';

class TestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TestState();
  }
}

class TestState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.android),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
              onPressed: () {
                getHttp();
              },
              child: Text("Click")),
        ),
      ),
    );
  }
}

void getHttp() async {
  Dio api = new Dio();
  /**
   * 异步解析json
   */
  api.transformer = FlutterTransformer();
  /**
   * 业务异常拦截器
   */
  api.interceptors.add(InterceptorsWrapper(onError: (error) async {
    if (error.type == DioErrorType.DEFAULT) {
      if (error.error is ApiException) {
        ApiException apiException = error.error;
        print(
            "接口业务异常返回：code =>[${apiException.code}],msg=>${apiException.msg}");
        //TODO 根据错误码进行业务操作
      }
    }
    return error;
  }, onResponse: (response) {
    if (!(response.data is Map)) {
      return;
    }
    var temp = BaseResponseEntity.fromJson(response.data);
    if (temp.code != 200 && temp.code != null) {
      throw ApiException(temp.code, temp.msg);
    }
  }));
  /**
   * header参数填充
   */
  api.interceptors.add(InterceptorsWrapper(onRequest:(options){
    options.headers["zbgj-user"] = "";
    options.headers["User-Agent"] = "";
  }));
  /**
   * 网络请求日志
   */
  api.interceptors.add(LogInterceptor(requestBody: true,responseHeader: false,responseBody: true));

  BaseApi baseApi = BaseApi(api);
  var response = await baseApi.test3();
  print(response.result);
}
