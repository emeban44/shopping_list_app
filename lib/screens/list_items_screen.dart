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
            height: 80,
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.green, width: 0.5)),
                gradient: LinearGradient(
                    colors: [Colors.blue.shade100, Colors.green.shade100])),
            child: Center(
              child: ListTile(
                leading: Container(
                    height: 50,
                    width: 50,
                    child: itemsList[i].category == 'Technology'
                        ? Image.asset('assets/images/technology.png')
                        : itemsList[i].category == 'Groceries'
                            ? Image.asset('assets/images/groceries.png')
                            : itemsList[i].category == 'Shoes'
                                ? Image.asset('assets/images/shoes.png')
                                : itemsList[i].category == 'Clothes'
                                    ? Image.asset('assets/images/clothes.png')
                                    : itemsList[i].category == 'Household'
                                        ? Image.asset(
                                            'assets/images/household.png')
                                        : Image.asset(
                                            'assets/images/pricetag.png')),
                /* Icon(
                  itemsList[i].category == 'Technology'
                      ? Icons.laptop_chromebook
                      : itemsList[i].category == 'Other'
                          ? Icons.category_rounded
                          : itemsList[i].category == 'Groceries'
                              ? Icons.local_grocery_store
                              : Icons.home,
                  size: 40,
                ),*/
                title: Text(
                  itemsList[i].name,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  itemsList[i].price.toStringAsFixed(2) + '\$',
                  style: TextStyle(
                      fontFamily: 'Lato', fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  Icons.check_box_outline_blank_rounded,
                  size: 31,
                ),
              ),
            ),
          );
        },
        itemCount: itemsList.length,
      );
    });
  }
}
