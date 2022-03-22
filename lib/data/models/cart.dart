import 'dart:convert';
import 'package:shoplants/data/models/plant.dart';

class Cart {
  final String id;
  final Plant plant;

  const Cart({
    required this.id,
    required this.plant,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'plant': plant.toMap(),
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id'] ?? '',
      plant: Plant.fromMap(map['plant']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));

  @override
  String toString() => 'Cart(id: $id, plant: $plant)';
}
