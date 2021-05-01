import 'package:flutter/material.dart';
import 'package:shopping_list_app/widgets/category_row.dart';
import 'package:shopping_list_app/widgets/item_text_field.dart';
import 'package:shopping_list_app/widgets/select_category.dart';

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
          Divider(
            color: Colors.green,
            height: 25,
            thickness: 0.8,
          ),
          SelectCategory(),
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
