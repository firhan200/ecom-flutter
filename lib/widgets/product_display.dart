import 'package:flutter/material.dart';
import 'package:gojek/models/product.dart';
import 'package:gojek/screens/product_detail_page.dart';

class ProductDisplay extends StatelessWidget {
  final Product product;

  ProductDisplay({this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (context) => ProductDetailPage(
                  product: product,
                )));
      },
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: product.id,
                child: Image.network(
                  product.imageUrl,
                  height: 100,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              product.name,
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              product.getPrice(),
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
