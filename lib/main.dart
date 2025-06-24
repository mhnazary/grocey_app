import 'package:flutter/material.dart';
import 'package:grocey_app/data/dummy_items.dart';
import 'package:grocey_app/widget/grocery_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 255, 255, 255),
        ),
        scaffoldBackgroundColor: Color.fromARGB(255, 50, 58, 60),
      ),

      home: GroceryList(),
    );
  }
}
