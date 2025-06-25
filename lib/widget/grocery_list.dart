import 'package:flutter/material.dart';
import 'package:grocey_app/data/dummy_items.dart';
import 'package:grocey_app/models/categories.dart';
import 'package:grocey_app/models/grocery_items.dart';
import 'package:grocey_app/widget/add_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItems> _groceryItem = [];

  void _addItem() async {
    final newItem = await Navigator.of(
      context,
    ).push<GroceryItems>(MaterialPageRoute(builder: (cts) => AddItem()));

    setState(() {
      _groceryItem.add(newItem!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery App'),
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
      ),
      body: ListView.builder(
        itemCount: _groceryItem.length,
        itemBuilder:
            (cts, index) => ListTile(
              title: Text(_groceryItem[index].name),
              leading: Container(
                height: 24,
                width: 24,
                color: _groceryItem[index].category.color,
              ),
              trailing: Text(_groceryItem[index].quantity.toString()),
            ),
      ),
    );
  }
}
