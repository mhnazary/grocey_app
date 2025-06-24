import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 79, 231, 254),
        ),
        scaffoldBackgroundColor: Color.fromARGB(255, 50, 58, 60),
      ),

      home: Scaffold(
        appBar: AppBar(title: Text('Grocery App')),
        body: Center(
          child: Text(
            'Grocery App contains ...',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
