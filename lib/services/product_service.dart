import 'package:gojek/models/category.dart';
import 'package:gojek/models/product.dart';

class ProductService {
  static //create dummy products
      List<Product> _products = <Product>[
    Product(
        id: 1,
        name: 'iPhone 5S Silver 64GB',
        price: 1500000,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/71x3e0x%2BM2L._AC_SX569_.jpg'),
    Product(
        id: 2,
        name: 'Samsung S10 Dark Grey 128GB',
        price: 10750000,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/71efuy%2B3ZNL._AC_SX466_.jpg'),
    Product(
        id: 3,
        name: 'TCL Unique Phone',
        price: 2240000,
        imageUrl:
            'https://m.media-amazon.com/images/I/71W6J+pf07L._SR500,500_.jpg'),
    Product(
        id: 4,
        name: 'Laptop ZenBook Asus 1TB',
        price: 15699000,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/G/01/consumerelectronics/CAC/PC/Home_Premium_Storefront.jpg'),
    Product(
        id: 5,
        name: 'Asus ROG Strix SCAR II',
        price: 35999000,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/81OyDqVoEaL._AC_SX466_.jpg'),
  ];

  static Future<List<Product>> getProducts() async {
    //mocking time await
    await Future.delayed(Duration(seconds: 2));

    var products = _products;

    return products;
  }

  static Future<List<Category>> getPopularCategories() async {
    //mocking time await
    await Future.delayed(Duration(seconds: 1));

    //create dummy products
    List<Category> categories = <Category>[
      Category(
          name: 'Apple',
          imageUrl:
              'https://images.unsplash.com/photo-1432888498266-38ffec3eaf0a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1053&q=80'),
      Category(
          name: 'Laptop',
          imageUrl:
              'https://images.unsplash.com/photo-1521790361543-f645cf042ec4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'),
      Category(
          name: 'Watch',
          imageUrl:
              'https://images.unsplash.com/photo-1531403009284-440f080d1e12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'),
    ];

    return categories;
  }

  static Future<Product> getProductById(int id) async {
    //mocking time await
    await Future.delayed(Duration(seconds: 2));

    var products = _products.where((element) => element.id == id).first;

    return products;
  }
}
