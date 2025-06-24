import 'package:flutter/material.dart';
import 'package:grocey_app/data/categories.dart';
import 'package:grocey_app/data/dummy_items.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _formkey = GlobalKey<FormState>();

  void saveItem() {
    _formkey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Added new Item')),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            TextFormField(
              maxLength: 50,
              decoration: InputDecoration(label: Text('Name')),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.trim().length <= 1) {
                  return 'Name must be a valid data';
                }
                return null;
              },
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(label: Text('quantity')),
                    initialValue: '1',
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length <= 1) {
                        return 'quantity must be a valid data';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField(
                    items: [
                      for (final category in categories.entries)
                        DropdownMenuItem(
                          value: category.value,
                          child: Row(
                            children: [
                              Container(
                                height: 16,
                                width: 16,
                                color: category.value.color,
                              ),
                              SizedBox(width: 6),
                              Text(category.value.title),
                            ],
                          ),
                        ),
                    ],
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _formkey.currentState!.reset();
                  },
                  child: Text('Reset'),
                ),
                ElevatedButton(onPressed: saveItem, child: Text('Add item')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
