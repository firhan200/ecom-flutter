import 'package:flutter/material.dart';
import 'package:gojek/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) =>
          Stack(overflow: Overflow.visible, children: <Widget>[
        Icon(Icons.shopping_basket),
        Positioned(
          top: -5,
          left: -10,
          child: Container(
            padding: EdgeInsets.all(3),
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: Center(
                child: Text(
              value.totalItemInCart.toString(),
              style: TextStyle(color: Colors.white),
            )),
          ),
        )
      ]),
    );
  }
}
