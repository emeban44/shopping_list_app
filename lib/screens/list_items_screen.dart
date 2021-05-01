import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list_app/models/item.dart';
import 'package:shopping_list_app/providers/shopping_provider.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Shopping>(builder: (context, shopping, _) {
      final List<Item> itemsList = shopping.getAllItems;
      return ListView.builder(
        itemBuilder: (ctx, i) {
          return Container(
            height: 70,
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text(
                itemsList[i].name,
                style: TextStyle(fontSize: 20),
              ),
              trailing: Text(itemsList[i].price.toStringAsFixed(2)),
            ),
          );
        },
        itemCount: itemsList.length,
      );
    });
  }
}
