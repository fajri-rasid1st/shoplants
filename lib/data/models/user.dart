import 'package:shoplants/data/models/plant.dart';

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
}
