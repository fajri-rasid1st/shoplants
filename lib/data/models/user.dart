import 'dart:convert';

class User {
  final String id;
  final String name;
  final String address;
  final String imagePath;

  const User({
    required this.id,
    required this.name,
    required this.address,
    required this.imagePath,
  });

  User copyWith({
    String? id,
    String? name,
    String? address,
    String? imagePath,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'imagePath': imagePath,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      imagePath: map['imagePath'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, name: $name, address: $address, imagePath: $imagePath)';
  }
}
