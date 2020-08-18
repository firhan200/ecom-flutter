import 'package:flutter/material.dart';
import 'package:gojek/models/product.dart';
import 'package:gojek/providers/cart_provider.dart';
import 'package:gojek/widgets/cart_icon.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  ProductDetailPage({this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back)),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/cart');
                      },
                      child: CartIcon())
                ],
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Hero(
                            tag: widget.product.id,
                            child: Image.network(
                              widget.product.imageUrl,
                              height: 300,
                            )),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          widget.product.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('PRICE'),
                              Text(
                                widget.product.getPrice(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('QUANTITY'),
                              Row(
                                children: [
                                  IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        setState(() {
                                          if (_quantity > 1) {
                                            _quantity--;
                                          }
                                        });
                                      }),
                                  Text(
                                    _quantity.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          _quantity++;
                                        });
                                      })
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('DESCRIPTION'),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                  Consumer<CartProvider>(
                    builder: (context, value, child) => Container(
                      width: double.infinity,
                      margin:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FlatButton.icon(
                            onPressed: () {
                              value.addToCart(widget.product, _quantity);
                            },
                            padding: EdgeInsets.all(16),
                            color: Colors.blue[700],
                            icon: Icon(
                              Icons.shopping_basket,
                              color: Colors.white,
                            ),
                            label: Text(
                              'ADD TO CART',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
