import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/categories.dart';

class CategoryBox extends StatefulWidget {
  final int index;
  final bool isChecked;
  final Function(int i) selectCategory;
  CategoryBox(this.index, this.isChecked, this.selectCategory);
  @override
  _CategoryBoxState createState() => _CategoryBoxState();
}

class _CategoryBoxState extends State<CategoryBox> {
  // bool _isSelected = isChecked;

  @override
  Widget build(BuildContext context) {
    return Container(
      //   color: _isSelected ? Colors.blue : Colors.transparent,
      // width: 140,
      //  padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: widget.isChecked ? Border.all(width: 0.25) : null,
        gradient: widget.isChecked
            ? LinearGradient(
                colors: [Colors.blue.shade100, Colors.green.shade100])
            : LinearGradient(colors: [Colors.transparent, Colors.transparent]),
      ),
      child: Row(
        children: [
          TextButton.icon(
            icon:
                /*widget.isChecked
                ? Icon(Icons.radio_button_on_rounded)
                : Icon(Icons.radio_button_off_rounded), */
                Image.asset(
              Categories.categoryImages[widget.index],
              width: 28,
            ),
            label: Text(
              Categories.categories[widget.index],
              style: TextStyle(fontSize: 23),
            ),
            onPressed: () => widget.selectCategory(widget.index),
            style: TextButton.styleFrom(
              primary: Color.fromRGBO(26, 131, 106, 1),
            ),
          ),
          /*Image.asset(
            Categories.categoryImages[widget.index],
            width: 25,
          ),*/
        ],
      ),
    );
  }
}
