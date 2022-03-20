import 'dart:convert';

class User {
  final String id;
  final String email;
  final String name;
  final String imagePath;

  const User({
    required this.id,
    required this.email,
    required this.name,
    required this.imagePath,
  });

  User copyWith({
    String? id,
    String? email,
    String? name,
    String? imagePath,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'imagePath': imagePath,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      imagePath: map['imagePath'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, email: $email, name: $name, imagePath: $imagePath)';
  }
}
