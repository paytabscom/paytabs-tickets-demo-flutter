import 'package:flutter/material.dart' show Color;

class Filter {
  final int id;
  final String name;
  final String image;
  final Color color;

  Filter({
    required this.id,
    required this.name,
    required this.image,
    required this.color,
  });
}
