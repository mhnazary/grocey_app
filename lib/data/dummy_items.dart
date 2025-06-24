import 'package:grocey_app/models/categories.dart';
import 'package:grocey_app/models/grocery_items.dart';
import 'package:grocey_app/data/categories.dart';

final groceryItems = [
  GroceryItems(
    id: 'a',
    name: 'Milk',
    quantity: 1,
    category: categories[Categories.dairy]!,
  ),
  GroceryItems(
    id: 'b',
    name: 'Bananas',
    quantity: 5,
    category: categories[Categories.fruit]!,
  ),
  GroceryItems(
    id: 'c',
    name: 'Beef Steak',
    quantity: 1,
    category: categories[Categories.meat]!,
  ),
];
