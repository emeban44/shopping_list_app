import 'package:flutter/material.dart';

class ItemTextField extends StatelessWidget {
  final String hint;
  final _controller;
  final _formKey;
  ItemTextField(this.hint, this._controller, this._formKey);
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
        // key: _formKey,
        controller: _controller,
        autocorrect: false,
        autofocus: false,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: (hint == 'Item Price...')
            ? TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        style: TextStyle(fontSize: 21),
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          errorStyle: TextStyle(fontSize: 15),
        ),
        validator: (value) {
          if (value.isEmpty) return 'Cannot be empty!';
          if (hint == 'Item Price...') {
            if (double.tryParse(value).runtimeType != double)
              return 'Price must be a number';
          }
          return null;
        },
      ),
    );
  }
}
