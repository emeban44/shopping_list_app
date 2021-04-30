import 'package:flutter/material.dart';
import 'package:shopping_list_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor:
            Color.fromRGBO(26, 131, 106, 1), //Color.fromRGBO(23, 155, 23, 1),
        canvasColor: Colors.blue.shade50, //Colors.green,
        primarySwatch: MaterialColor(0xff4cd1b9, color),
        fontFamily: 'Kanit',
      ),
      home: HomeScreen(),
    );
  }

  final Map<int, Color> color = {
    50: Color.fromRGBO(26, 131, 106, .1),
    100: Color.fromRGBO(26, 131, 106, .2),
    200: Color.fromRGBO(26, 131, 106, .3),
    300: Color.fromRGBO(26, 131, 106, .4),
    400: Color.fromRGBO(26, 131, 106, .5),
    500: Color.fromRGBO(26, 131, 106, .6),
    600: Color.fromRGBO(26, 131, 106, .7),
    700: Color.fromRGBO(26, 131, 106, .8),
    800: Color.fromRGBO(26, 131, 106, .9),
    900: Color.fromRGBO(26, 131, 106, 1),
  };
}
