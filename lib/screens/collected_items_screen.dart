import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list_app/providers/shopping_provider.dart';

class CollectedItemsScreen extends StatefulWidget {
  @override
  _CollectedItemsScreenState createState() => _CollectedItemsScreenState();
}

class _CollectedItemsScreenState extends State<CollectedItemsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Provider.of<Shopping>(context, listen: false)
          .fetchAndSetCollectedItems(),
      child: Container(
        child: Consumer<Shopping>(
          builder: (ctx, shopping, _) {
            final collectedItems = shopping.getCollectedItems;
            return ListView.builder(
              itemBuilder: (ctx, i) {
                return Container(
                  height: 90,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.green, width: 0.25),
                    ),
                  ),
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        Icons.check_box,
                        size: 40,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text(
                        collectedItems[i].name,
                        style: TextStyle(fontSize: 22, fontFamily: 'Kanit'),
                      ),
                      subtitle: Text(
                        'Collected at: ' +
                            DateTime.parse(collectedItems[i].time)
                                .toString()
                                .substring(0, 10),
                      ),
                      trailing: Text(
                          collectedItems[i].price.toStringAsFixed(2) + '\$',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                );
              },
              itemCount: collectedItems.length,
            );
          },
        ),
      ),
    );
  }
}
