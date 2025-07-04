import 'package:grocey_app/models/categories.dart';

class GroceryItems {
  const GroceryItems({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });

  final String id;
  final String name;
  final int quantity;
  final Category category;
}
