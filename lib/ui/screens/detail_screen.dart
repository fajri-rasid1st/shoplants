import 'package:flutter/material.dart';
import 'package:shoplants/data/models/plant.dart';

class DetailScreen extends StatefulWidget {
  final Plant plant;

  const DetailScreen({Key? key, required this.plant}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.plant.toString()),
      ),
    );
  }
}
