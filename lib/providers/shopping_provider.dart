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
          time: docItem.data()['addedAt'].toString(),
          name: docItem.data()['name'],
          category: docItem.data()['category'],
          price: docItem.data()['price']));
    });
    notifyListeners();
  }

  Future<void> addItem(
      String enteredName, String enteredPrice, String selectedCategory) async {
    String id = DateTime.now().toIso8601String();
    final Item item = Item(
      name: enteredName,
      price: double.parse(enteredPrice),
      category: selectedCategory,
      time: id,
    );
    await FirebaseFirestore.instance.collection('itemsList').add({
      'name': item.name,
      'price': item.price,
      'category': item.category,
      'addedAt': id,
    });
    _items.insert(0, item);
    notifyListeners();
  }

  Future<bool> deleteItem(Item item) async {
    try {
      // print(item.time);
      final documents =
          await FirebaseFirestore.instance.collection('itemsList').get();
      final docToDelete = documents.docs
          .firstWhere((element) => element.data()['addedAt'] == item.time);
      await FirebaseFirestore.instance
          .collection('itemsList')
          .doc(docToDelete.id)
          .delete();
      _items.removeWhere((element) => element.time == item.time);
      notifyListeners();
    } catch (error) {
      print('greska');
      print(error.message);
      return false;
    }
    return true;
  }
}
