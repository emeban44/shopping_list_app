import 'package:flutter/material.dart';

class ItemTextField extends StatelessWidget {
  final String hint;
  ItemTextField(this.hint);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade100,
            Colors.green.shade100,
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        keyboardType: (hint == 'Item Price...')
            ? TextInputType.number
            : TextInputType.name,
        style: TextStyle(fontSize: 21),
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
