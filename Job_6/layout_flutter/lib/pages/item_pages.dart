// lib/pages/item_page.dart
import 'package:flutter/material.dart';
import 'package:layout_flutter/models/Item.dart';
class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve the item passed through the arguments
    final Item item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: item.name,
              child: Image.asset(
                item.image,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Price: \$${item.price}',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 8),
            Text(
              'Stock: ${item.stock}',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Rating: ${item.rating} ⭐',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
