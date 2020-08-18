import 'package:flutter/material.dart';
import 'package:gojek/models/category.dart';
import 'package:gojek/models/product.dart';
import 'package:gojek/providers/drawer_provider.dart';
import 'package:gojek/providers/products_provider.dart';
import 'package:gojek/screens/drawer_page.dart';
import 'package:gojek/widgets/category_display.dart';
import 'package:gojek/widgets/product_display.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerProvider>(
      builder: (context, value, child) => WillPopScope(
        onWillPop: () {
          if (value.isDrawerOpen) {
            //close drawer
            value.toggleDrawer();
            return Future.value(false);
          } else {
            //oke to back
            return Future.value(true);
          }
        },
        child: Stack(children: <Widget>[
          /* menu */
          DrawerPage(),

          /* content animation wrapper */
          AnimatedContainer(
            transform:
                Matrix4.translationValues(value.xOffset, value.yOffset, 0)
                  ..scale(value.scale),
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      spreadRadius: 7,
                      color: Colors.blue[700],
                      offset: Offset(3, 5))
                ],
                borderRadius: value.isDrawerOpen
                    ? BorderRadius.circular(20)
                    : BorderRadius.zero),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: SafeArea(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Transform.rotate(
                                angle: -40 * math.pi / 180,
                                child: Icon(
                                  Icons.pan_tool,
                                  color: Colors.yellow[700],
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Good Morning',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    Text(
                                      'John Doe',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    )
                                  ]),
                            ],
                          ),
                          GestureDetector(
                              onTap: () {
                                value.toggleDrawer();
                              },
                              child: Icon(value.isDrawerOpen
                                  ? Icons.arrow_forward
                                  : Icons.menu))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Consumer<ProductsProvider>(
                        builder: (context, value, child) => RefreshIndicator(
                          onRefresh: () async {
                            value.getCategories();
                            value.getProducts();
                          },
                          child: SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.search),
                                        hintText: "Search product you wish...",
                                        fillColor: Colors.grey[100],
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Popular Categories',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                  value.isCategoriesLoading
                                      ? CircularProgressIndicator()
                                      : Container(
                                          height: 120,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: value.categories.length,
                                            itemBuilder: (context, index) {
                                              Category category =
                                                  value.categories[index];
                                              return CategoryDisplay(
                                                category: category,
                                              );
                                            },
                                          ),
                                        ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Products',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                  value.isLoading
                                      ? Container(
                                          child: CircularProgressIndicator(),
                                        )
                                      : GridView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: value.products.length,
                                          shrinkWrap: true,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: MediaQuery.of(
                                                                  context)
                                                              .orientation ==
                                                          Orientation.landscape
                                                      ? 4
                                                      : 2,
                                                  childAspectRatio: MediaQuery
                                                                  .of(context)
                                                              .orientation ==
                                                          Orientation.landscape
                                                      ? 0.7
                                                      : 0.9),
                                          itemBuilder: (context, index) {
                                            Product product =
                                                value.products[index];
                                            return ProductDisplay(
                                              product: product,
                                            );
                                          })
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
