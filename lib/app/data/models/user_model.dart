class User {
  int? id;
  String name = '';

  User({
    this.id,
  });

  User.fromJson(Map<String, dynamic> json) {
    this.id = id ?? this.id;
    this.name = name;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
    };
  }
}