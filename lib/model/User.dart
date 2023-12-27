class User {
  final String id;
  final String username;
  final String email;
  final DateTime registrationDate;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.registrationDate,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'registrationDate': registrationDate.toUtc().toIso8601String(),
      };

  factory User.fromJson(Map<String, dynamic>? json, String id) {
    return User(
      id: id,
      username: json?['username'] ?? '',
      email: json?['email'] ?? '',
      registrationDate: DateTime.parse(json?['registrationDate'] ?? ''),
    );
  }
}
