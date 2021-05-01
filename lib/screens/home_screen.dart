import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_list_app/providers/shopping_provider.dart';
import 'package:shopping_list_app/screens/add_item_screen.dart';
import 'package:shopping_list_app/screens/collected_items_screen.dart';
import 'package:shopping_list_app/screens/list_items_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _pages = [
    ListScreen(),
    AddItemScreen(),
    CollectedItemsScreen(),
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    Provider.of<Shopping>(context, listen: false).fetchAndSetItems();
    Provider.of<Shopping>(context, listen: false).fetchAndSetCollectedItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'MyShopping List',
            style: TextStyle(
              fontFamily: 'NewTegomin',
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: _pages[_selectedPageIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 0.75,
              ),
            ),
          ),
          child: BottomNavigationBar(
            //  backgroundColor: Colors.blue.shade100,
            currentIndex: _selectedPageIndex,
            onTap: _selectPage,
            backgroundColor: Colors.green.shade50,
            unselectedLabelStyle: TextStyle(fontSize: 15),
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.list_alt_rounded,
                  size: 40,
                ),
                icon: Icon(
                  Icons.list_alt_rounded,
                  size: 36,
                ),
                label: 'Shopping List',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 100,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.shade200,
                        Colors.green.shade200,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 0.5,
                    ),
                  ),
                  child: Icon(
                    Icons.add_shopping_cart_rounded,
                    size: 40,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.check_box_rounded,
                  size: 40,
                ),
                icon: Icon(
                  Icons.check_box_outlined,
                  size: 36,
                ),
                label: 'Collected',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
