import 'package:flutter/material.dart';
import 'package:shopping_list_app/widgets/category_box.dart';

class CategoryRow extends StatelessWidget {
  // final int index;
  final List<bool> checked;
  final Function(int i) selectCategory;
  CategoryRow(this.checked, this.selectCategory);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryBox(0, checked[0], selectCategory),
              CategoryBox(2, checked[2], selectCategory),
              CategoryBox(4, checked[4], selectCategory),
            ],
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryBox(1, checked[1], selectCategory),
              CategoryBox(3, checked[3], selectCategory),
              CategoryBox(5, checked[5], selectCategory),
            ],
          ),
        ),
        /*
        if (index == 0) CategoryBox(0, isFirstSelected, selectCategory),
        if (index == 0) CategoryBox(1, isSecondSelected, selectCategory),
        if (index == 1) CategoryBox(2, isFirstSelected, selectCategory),
        if (index == 1) CategoryBox(3, isSecondSelected, selectCategory),
        if (index == 2) CategoryBox(4, isFirstSelected, selectCategory),
        if (index == 2) CategoryBox(5, isSecondSelected, selectCategory),*/
      ],
    ));
  }
}
