import 'package:flutter/material.dart';
import 'package:gojek/providers/cart_provider.dart';
import 'package:gojek/providers/drawer_provider.dart';
import 'package:gojek/providers/products_provider.dart';
import 'package:gojek/screens/cart_page.dart';

import 'package:gojek/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CartProvider()),
      ChangeNotifierProvider(create: (context) => ProductsProvider()),
      ChangeNotifierProvider(create: (context) => DrawerProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/cart': (context) => CartPage(),
      },
    ),
  ));
}
