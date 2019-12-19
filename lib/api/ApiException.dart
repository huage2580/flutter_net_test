
class ApiException implements Exception{

  ApiException(this.code,[this.msg]);
  int code;
  String msg;

  @override
  String toString() {
    return '业务异常{code: $code, msg: $msg}';
  }


}