// lib/pages/item_page.dart
import 'package:flutter/material.dart';
import 'package:layout_flutter/models/item.dart';

class ItemPage extends StatelessWidget {
  final Item item;

  const ItemPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Center(
        child: Text(
          'Price: \$${item.price}',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
