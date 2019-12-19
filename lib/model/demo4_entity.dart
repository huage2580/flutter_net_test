class Demo4Entity {
	bool qwe;

	Demo4Entity({this.qwe});

	Demo4Entity.fromJson(Map<String, dynamic> json) {
		qwe = json['qwe'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['qwe'] = this.qwe;
		return data;
	}
}
