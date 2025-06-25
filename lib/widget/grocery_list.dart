import 'package:flutter/material.dart';
import 'package:grocey_app/data/dummy_items.dart';
import 'package:grocey_app/widget/add_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void _addItem() {
    Navigator.of(context).push(MaterialPageRoute(builder: (cts) => AddItem()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery App'),
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder:
            (cts, index) => ListTile(
              title: Text(groceryItems[index].name),
              leading: Container(
                height: 24,
                width: 24,
                color: groceryItems[index].category.color,
              ),
              trailing: Text(groceryItems[index].quantity.toString()),
            ),
      ),
    );
  }
}
