// lib/models/item.dart
import 'package:flutter/material.dart';

class Item {
  final String name;
  final int price;
  final String image; // URL or asset path for the image
  final int stock;
  final double rating;

  Item({
    required this.name,
    required this.price,
    required this.image,
    required this.stock,
    required this.rating,
  });
}
