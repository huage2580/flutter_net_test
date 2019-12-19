

import 'package:flutter_net_test/entity_factory.dart';

class BaseResponseList<T> {
	String msg;
	int code;
	List<T> result;

	BaseResponseList({this.msg, this.code});


	@override
	String toString() {
		return 'BaseResponseList{msg: $msg, code: $code,[result:$result]}';
	}

	BaseResponseList.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		List list = json['result'];
		result = List();
		for(int i=0;i<list.length;i++){
			T temp = EntityFactory.generateOBJ<T>(list[i]);
			result.add(temp);
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
