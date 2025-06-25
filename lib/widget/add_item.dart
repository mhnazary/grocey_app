import 'package:flutter/material.dart';
import 'package:grocey_app/data/categories.dart';
import 'package:grocey_app/models/categories.dart';
import 'package:grocey_app/models/grocery_items.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _formkey = GlobalKey<FormState>();

  var _enterdName = '';
  var _enterdQuantity = 1;
  var _selectCategory = categories[Categories.vegetables];

  void saveItem() {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();

      Navigator.of(context).pop(
        GroceryItems(
          id: DateTime.now().toString(),
          name: _enterdName,
          quantity: _enterdQuantity,
          category: _selectCategory!,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Added new Item')),
      body: Form(
        key: _formkey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                style: TextStyle(fontSize: 16, color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.white70),
                  counterStyle: TextStyle(color: Colors.white54),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.black26,
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1) {
                    return 'Name must be at least 2 characters';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enterdName = value!;
                },
              ),

              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: '1',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                        labelStyle: TextStyle(color: Colors.white70),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.black26,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Quantity must be a valid number';
                        }
                        if (int.tryParse(value) == null ||
                            int.parse(value) <= 0) {
                          return 'Enter a positive number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enterdQuantity = int.parse(value!);
                      },
                    ),
                  ),

                  SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectCategory,
                      decoration: InputDecoration(
                        labelText: 'Category',
                        labelStyle: TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor: Colors.black26,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      dropdownColor: Colors.grey[900],
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
                                Text(
                                  category.value.title,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectCategory = value!;
                        });
                      },
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
      ),
    );
  }
}
