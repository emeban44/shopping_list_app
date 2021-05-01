import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/categories.dart';

import 'package:shopping_list_app/widgets/item_text_field.dart';
import 'package:shopping_list_app/widgets/select_category.dart';

class AddItemScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _tryAddItem(BuildContext ctx) {
    FocusScope.of(ctx).unfocus();
    bool _isValid = _formKey.currentState.validate();
    if (_isValid) _formKey.currentState.reset();
    // print(_isValid);
    // print(_categoryValidation(ctx));
    if (_categoryValidation(ctx) && _isValid) {
      print('sve ok');
    }
  }

  bool _categoryValidation(BuildContext ctx) {
    //print(Categories.categorySelection);
    if (!Categories.categorySelection.contains(true)) {
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(
            'Select a category!',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 1),
        ),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 13,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    ItemTextField('Item Name...', _nameController, _formKey),
                    ItemTextField('Item Price...', _priceController, _formKey),
                  ],
                ),
              ),
            ),
            /*ItemTextField('Item Name...', _nameController),
            ItemTextField('Item Price...', _priceController), */
            Divider(
              color: Colors.green,
              height: 25,
              thickness: 0.8,
            ),
            SelectCategory(),
            Container(
                margin: const EdgeInsets.only(top: 15),
                child: Text(
                  'Pick item category',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    //  fontWeight: FontWeight.bold,
                  ),
                )),
            Divider(
              color: Colors.green,
              height: 20,
              thickness: 0.8,
            ),
            Container(
              width: 200,
              height: 50,
              margin: const EdgeInsets.only(top: 10),
              child: ElevatedButton.icon(
                icon: Icon(Icons.add),
                label: Text(
                  'Add Item',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () => _tryAddItem(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
