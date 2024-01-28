class User {
  final String name;
  final String password;
  final String email;

  User({
    required this.name,
    required this.password,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      password: json['password'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'password': password,
      'email': email,
    };
  }
}
