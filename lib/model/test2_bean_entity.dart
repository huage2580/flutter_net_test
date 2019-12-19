class Test2BeanEntity {
	String name;

	Test2BeanEntity({this.name});


	@override
	String toString() {
		return 'Test2BeanEntity{name: $name}';
	}

	Test2BeanEntity.fromJson(Map<String, dynamic> json) {
		name = json['name'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		return data;
	}
}
