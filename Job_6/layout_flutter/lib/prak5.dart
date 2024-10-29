// lib/main.dart
import 'package:flutter/material.dart';
import 'package:layout_flutter/pages/home_pages.dart';
import 'package:layout_flutter/pages/item_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/item': (context) => ItemPage(), // Register the item page route
      },
    );
  }
}
