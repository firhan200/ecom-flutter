import 'package:flutter/cupertino.dart';
import 'package:gojek/models/cart.dart';
import 'package:gojek/models/product.dart';

class CartProvider with ChangeNotifier {
  /* private vars */
  List<Cart> _cartItems = List<Cart>();
  int _totalItemInCart = 0;

  /* getters */
  List<Cart> get cartItems => _cartItems;
  int get totalItemInCart => _totalItemInCart;

  void addToCart(Product product, int quantity) {
    bool isExist = false;

    //check if already in cart
    cartItems.forEach((cart) {
      if (cart.productId == product.id) {
        //already in cart, append qty
        cart.quantity += quantity;
        isExist = true;
      }
    });

    //check if already append to cart items
    if (!isExist) {
      cartItems.add(Cart(
          productId: product.id,
          quantity: quantity,
          productName: product.name,
          productPrice: product.price,
          productImage: product.imageUrl));
    }

    //update total item in cart for displat
    updateTotalItem();

    //trigger listener
    notifyListeners();
  }

  void increaseQuantity(int productId) {
    //check if already in cart
    cartItems.forEach((cart) {
      if (cart.productId == productId) {
        //already in cart, append qty
        cart.quantity += 1;
      }
    });

    //trigger listener
    notifyListeners();
  }

  void decreaseQuantity(int productId) {
    //check if already in cart
    cartItems.forEach((cart) {
      if (cart.productId == productId) {
        //check if greater than 1, cannot be 0
        if (cart.quantity > 1) {
          //already in cart, append qty
          cart.quantity -= 1;
        }
      }
    });

    //trigger listener
    notifyListeners();
  }

  void removeItem(int productId) {
    _cartItems =
        cartItems.where((element) => element.productId != productId).toList();

    updateTotalItem();

    //trigger listener
    notifyListeners();
  }

  void updateTotalItem() {
    _totalItemInCart = cartItems.length;
  }
}
