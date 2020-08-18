import 'package:flutter/material.dart';
import 'package:gojek/models/category.dart';

class CategoryDisplay extends StatelessWidget {
  final Category category;

  CategoryDisplay({this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 8),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(category.imageUrl)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              category.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(4, 3),
                      blurRadius: 16.0,
                      color: Colors.grey[800],
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
