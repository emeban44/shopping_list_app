import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/categories.dart';

import 'category_row.dart';

class SelectCategory extends StatefulWidget {
  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  List<bool> _selection = [false, false, false, false, false, false];
  void _checkCategory(int i) {
    setState(() {
      _selection[i] = !_selection[i];
      Categories.categorySelection[i] = !Categories.categorySelection[i];
      for (int y = 0; y < _selection.length; y++) {
        if (y == i)
          continue;
        else {
          _selection[y] = false;
          Categories.categorySelection[y] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        CategoryRow(_selection, _checkCategory)
        /*
        CategoryRow(0, _selection[0], _selection[1], _checkCategory),
        CategoryRow(1, _selection[2], _selection[3], _checkCategory),
        CategoryRow(2, _selection[4], _selection[5], _checkCategory),*/
      ],
    ));
  }
}
