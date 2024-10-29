// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:layout_flutter/models/item.dart';
import 'package:layout_flutter/pages/item_pages.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Sugar', price: 5000),
    Item(name: 'Salt', price: 2000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(item.name),
              subtitle: Text('Price: \$${item.price}'),
              onTap: () {
                // Navigate to the item page with the selected item
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemPage(item: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
