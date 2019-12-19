class Test3Entity {
	int age;

	Test3Entity({this.age});

	Test3Entity.fromJson(Map<String, dynamic> json) {
		age = json['age'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['age'] = this.age;
		return data;
	}
}
