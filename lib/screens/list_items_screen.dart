import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list_app/models/item.dart';
import 'package:shopping_list_app/providers/shopping_provider.dart';
import 'package:shopping_list_app/widgets/collected_check_box.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () =>
          Provider.of<Shopping>(context, listen: false).fetchAndSetItems(),
      child: Consumer<Shopping>(builder: (context, shopping, _) {
        final List<Item> itemsList = shopping.getAllItems;
        return ListView.builder(
          itemBuilder: (ctx, i) {
            return Dismissible(
              key: ValueKey(itemsList[i].time),
              background: Container(
                padding: const EdgeInsets.only(right: 10),
                color: Colors.red,
                child: Icon(
                  Icons.delete_sweep_outlined,
                  color: Colors.white70,
                  size: 40,
                ),
                alignment: Alignment.centerRight,
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                return Provider.of<Shopping>(context, listen: false)
                    .deleteItem(itemsList[i]);
              },
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.green, width: 0.5)),
                    gradient: LinearGradient(
                        colors: [Colors.blue.shade100, Colors.green.shade100])),
                child: Center(
                  child: ListTile(
                    leading: Container(
                      height: 40,
                      width: 40,
                      child: itemsList[i].category == 'Technology'
                          ? Image.asset('assets/images/technology.png')
                          : itemsList[i].category == 'Groceries'
                              ? Image.asset('assets/images/groceries.png')
                              : itemsList[i].category == 'Shoes'
                                  ? Image.asset('assets/images/basic_shoes.png')
                                  : itemsList[i].category == 'Clothes'
                                      ? Image.asset('assets/images/clothes.png')
                                      : itemsList[i].category == 'Household'
                                          ? Image.asset(
                                              'assets/images/household.png')
                                          : Image.asset(
                                              'assets/images/pricetag.png'),
                    ),
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
                    trailing: CollectedCheckBox(itemsList[i]),
                  ),
                ),
              ),
            );
          },
          itemCount: itemsList.length,
        );
      }),
    );
  }
}
