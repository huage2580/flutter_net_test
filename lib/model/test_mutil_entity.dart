class TestMutilEntity {
	int aInt;
	TestMutilObj obj;
	double aDouble;
	String aStr;

	TestMutilEntity({this.aInt, this.obj, this.aDouble, this.aStr});

	TestMutilEntity.fromJson(Map<String, dynamic> json) {
		aInt = json['aInt'];
		obj = json['obj'] != null ? new TestMutilObj.fromJson(json['obj']) : null;
		aDouble = json['aDouble'];
		aStr = json['aStr'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['aInt'] = this.aInt;
		if (this.obj != null) {
      data['obj'] = this.obj.toJson();
    }
		data['aDouble'] = this.aDouble;
		data['aStr'] = this.aStr;
		return data;
	}

	@override
	String toString() {
		return 'TestMutilEntity{aInt: $aInt, obj: $obj, aDouble: $aDouble, aStr: $aStr}';
	}


}

class TestMutilObj {
	List<String> array;
	String hello;

	TestMutilObj({this.array, this.hello});

	TestMutilObj.fromJson(Map<String, dynamic> json) {
		array = json['array']?.cast<String>();
		hello = json['hello'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['array'] = this.array;
		data['hello'] = this.hello;
		return data;
	}

	@override
	String toString() {
		return 'TestMutilObj{array: $array, hello: $hello}';
	}


}
