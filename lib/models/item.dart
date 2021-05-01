import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Item {
  final String name;
  final double price;
  final String category;
  final String time;
  bool isCollected = false;

  Item({
    @required this.name,
    @required this.price,
    @required this.category,
    @required this.time,
  });
}
