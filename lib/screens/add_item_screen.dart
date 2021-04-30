import 'package:flutter/material.dart';
import 'package:shopping_list_app/widgets/item_text_field.dart';

class AddItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 13,
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          ItemTextField('Item Name...'),
          ItemTextField('Item Price...'),
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
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
