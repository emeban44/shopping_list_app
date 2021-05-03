import 'package:flutter/material.dart';

import '../widgets/category_box.dart';

class CategoryRow extends StatelessWidget {
  final List<bool> checked;
  final Function(int i) selectCategory;
  CategoryRow(this.checked, this.selectCategory);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
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
      ],
    ));
  }
}
