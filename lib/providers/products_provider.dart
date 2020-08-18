import 'package:flutter/cupertino.dart';
import 'package:gojek/models/category.dart';
import 'package:gojek/models/product.dart';
import 'package:gojek/services/product_service.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _products = List<Product>();
  List<Product> get products => _products;

  List<Category> _categories = List<Category>();
  List<Category> get categories => _categories;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isCategoriesLoading = false;
  bool get isCategoriesLoading => _isCategoriesLoading;

  ProductsProvider() {
    getProducts();
    getCategories();
  }

  void getProducts() async {
    //set is loading
    _isLoading = true;

    //get products from service
    _products = await ProductService.getProducts();

    //set is loading
    _isLoading = false;

    notifyListeners();
  }

  void getCategories() async {
    //set is loading
    _isCategoriesLoading = true;

    //get products from service
    _categories = await ProductService.getPopularCategories();

    //set is loading
    _isCategoriesLoading = false;

    notifyListeners();
  }
}
