

import 'package:flutter_net_test/entity_factory.dart';

class BaseResponseEntity<T> {
	String msg;
	int code;
	T result;

	BaseResponseEntity({this.msg, this.code});


	@override
	String toString() {
		return 'BaseResponseEntity{msg: $msg, code: $code,[result:$result]}';
	}

	BaseResponseEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		switch(T.toString()){//基本类型
			case 'int':
			case 'String':
			case 'bool':{
				result = json['result'];
			}
			break;
			default:{
				result = EntityFactory.generateOBJ<T>(json['result']);
			}
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['msg'] = this.msg;
		data['code'] = this.code;
		//!![WARNING] 这里没实现result
		return data;
	}
}
