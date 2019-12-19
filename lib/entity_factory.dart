import 'package:flutter_net_test/model/demo4_entity.dart';
import 'package:flutter_net_test/model/test2_bean_entity.dart';
import 'package:flutter_net_test/model/test3_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "Demo4Entity") {
      return Demo4Entity.fromJson(json) as T;
    } else if (T.toString() == "Test2BeanEntity") {
      return Test2BeanEntity.fromJson(json) as T;
    } else if (T.toString() == "Test3Entity") {
      return Test3Entity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}