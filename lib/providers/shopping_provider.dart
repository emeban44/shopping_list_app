import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/item.dart';

class Shopping with ChangeNotifier {
  static List<Item> _items = [];

  static List<Item> _collectedItems = [];

  List<Item> get getAllItems {
    return [..._items];
  }

  List<Item> get getCollectedItems {
    return [..._collectedItems];
  }

  Future<void> fetchAndSetItems() async {
    List<Item> tmp = [];
    final itemsList = await FirebaseFirestore.instance
        .collection('itemsList')
        .orderBy('addedAt', descending: true)
        .get();
    itemsList.docs.forEach((docItem) {
      tmp.add(Item(
          time: docItem.data()['addedAt'].toString(),
          name: docItem.data()['name'],
          category: docItem.data()['category'],
          price: docItem.data()['price']));
    });
    _items = tmp;
    notifyListeners();
  }

  Future<void> addItem(String enteredName, String enteredPrice,
      String selectedCategory, BuildContext ctx) async {
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
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      content: Text(
        'Item added!',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
      backgroundColor: Theme.of(ctx).primaryColor,
      duration: Duration(seconds: 1),
    ));
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

  Future<void> collectItem(Item item) async {
    final String collectedAt = DateTime.now().toIso8601String();
    await FirebaseFirestore.instance.collection('collectedItems').add({
      'name': item.name,
      'price': item.price,
      'category': item.category,
      'addedAt': item.time,
      'collectedAt': collectedAt,
    });
    _collectedItems.insert(
        0,
        Item(
            name: item.name,
            category: item.category,
            price: item.price,
            time: collectedAt));
    notifyListeners();
  }

  Future<bool> removeCollectedItem(Item item) async {
    try {
      // print(item.time);
      final documents =
          await FirebaseFirestore.instance.collection('collectedItems').get();
      final docToDelete = documents.docs
          .firstWhere((element) => element.data()['collectedAt'] == item.time);
      _collectedItems.removeWhere((element) => element.time == item.time);
      notifyListeners();
      await FirebaseFirestore.instance
          .collection('collectedItems')
          .doc(docToDelete.id)
          .delete();
    } catch (error) {
      print('greska');
      print(error.message);
      return false;
    }
    return true;
  }

  Future<void> fetchAndSetCollectedItems() async {
    List<Item> tmp = [];
    final collectedItems = await FirebaseFirestore.instance
        .collection('collectedItems')
        .orderBy('collectedAt', descending: true)
        .get();
    collectedItems.docs.forEach((docItem) {
      tmp.add(Item(
          time: docItem.data()['collectedAt'].toString(),
          name: docItem.data()['name'],
          category: docItem.data()['category'],
          price: docItem.data()['price']));
    });
    _collectedItems = tmp;
    notifyListeners();
  }
}
