import 'package:flutter/material.dart';
import 'package:gojek/models/cart.dart';
import 'package:gojek/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) => Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      'My Cart',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: value.cartItems.length,
                  itemBuilder: (context, index) {
                    Cart cart = value.cartItems[index];

                    return Dismissible(
                      key: ValueKey(cart.productId),
                      onDismissed: (direction) {
                        value.removeItem(cart.productId);
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 1,
                                  blurRadius: 16,
                                  color: Colors.grey[200],
                                  offset: Offset(1, 2))
                            ]),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  cart.productImage,
                                  width: 100,
                                  height: 100,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cart.productName,
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        cart.getTotalPrice(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        value.decreaseQuantity(cart.productId);
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomLeft:
                                                    Radius.circular(10)),
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.grey[300])),
                                        child: Icon(Icons.remove),
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: Colors.grey[300])),
                                      child: Center(
                                          child:
                                              Text(cart.quantity.toString())),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        value.increaseQuantity(cart.productId);
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10)),
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.grey[300])),
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                  ],
                                ),
                                FlatButton.icon(
                                    onPressed: () {
                                      value.removeItem(cart.productId);
                                    },
                                    icon: Icon(Icons.remove_shopping_cart),
                                    label: Text('Remove'))
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FlatButton.icon(
                      onPressed: () {},
                      padding: EdgeInsets.all(16),
                      color: Colors.blue[700],
                      icon: Icon(
                        Icons.payment,
                        color: Colors.white,
                      ),
                      label: Text(
                        'CHECKOUT',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
