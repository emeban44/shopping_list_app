import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';
import '../providers/shopping_provider.dart';

class CollectedCheckBox extends StatefulWidget {
  final Item item;
  CollectedCheckBox(this.item);
  @override
  _CollectedCheckBoxState createState() => _CollectedCheckBoxState();
}

class _CollectedCheckBoxState extends State<CollectedCheckBox> {
  bool _isChecked = false;
  @override
  void initState() {
    final collection =
        Provider.of<Shopping>(context, listen: false).getCollectedItems;
    collection.forEach((element) {
      if (element.name == widget.item.name &&
          element.price == widget.item.price &&
          element.category == widget.item.category) {
        setState(() {
          _isChecked = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (_isChecked)
            Flexible(
                child: Text(
              'Collected',
              style: TextStyle(fontSize: 17),
            )),
          Flexible(
            child: IconButton(
              icon: Icon(
                _isChecked
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank,
                size: 27,
              ),
              onPressed: _isChecked
                  ? null
                  : () {
                      setState(() {
                        _isChecked = !_isChecked;
                      });
                      Provider.of<Shopping>(context, listen: false)
                          .collectItem(widget.item);
                    },
            ),
          ),
        ],
      ),
    );
  }
}
