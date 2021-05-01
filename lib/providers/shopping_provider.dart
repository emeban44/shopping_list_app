import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/item.dart';

class Shopping with ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get getAllItems {
    return [..._items];
  }

  Future<void> fetchAndSetItems() async {
    final itemsList = await FirebaseFirestore.instance
        .collection('itemsList')
        .orderBy('addedAt', descending: true)
        .get();
    itemsList.docs.forEach((docItem) {
      _items.add(Item(
          name: docItem.data()['name'],
          category: docItem.data()['category'],
          price: docItem.data()['price']));
    });
    notifyListeners();
  }

  Future<void> addItem(
      String enteredName, String enteredPrice, String selectedCategory) async {
    final Item item = Item(
      name: enteredName,
      price: double.parse(enteredPrice),
      category: selectedCategory,
    );
    await FirebaseFirestore.instance.collection('itemsList').add({
      'name': item.name,
      'price': item.price,
      'category': item.category,
      'addedAt': Timestamp.now(),
    });
    _items.insert(0, item);
    notifyListeners();
  }
}
