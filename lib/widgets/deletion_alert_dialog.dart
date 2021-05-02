import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list_app/models/item.dart';
import 'package:shopping_list_app/providers/shopping_provider.dart';

class DeleteAlertDialog {
  static Future<void> showMyDialog(Item item, BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remove collected item:',
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
                fontFamily: 'Kanit',
              )),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  item.name + '\n',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Are you sure you want to remove this from collected?',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 16,
                    //  fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Provider.of<Shopping>(context, listen: false)
                    .removeCollectedItem(item);
                Navigator.of(context).pop();
              },
              child: Text(
                'Yes',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              child: Text(
                'No',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
