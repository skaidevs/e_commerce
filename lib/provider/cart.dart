import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;

  CartItem({
    @required this.id,
    this.title,
    this.quantity,
    this.price,
    this.imageUrl,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach(
        (key, cartItem) => {total += cartItem.price * cartItem.quantity});
    return total;
  }

  void addItem(String prodId, double price, String title, String imageUrl) {
    if (_items.containsKey(prodId)) {
      //change quantity
      _items.update(
        prodId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
          imageUrl: existingCartItem.imageUrl,
        ),
      );
    } else {
      _items.putIfAbsent(
        prodId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
          imageUrl: imageUrl,
        ),
      );
      notifyListeners();
    }
  }

  void removeSingleItem(String productId) {
    //if product is part of the cart return
    if (!_items.containsKey(productId)) {
      return;
    }

    //if the product is is > 1 then there is an entry{if yes!
    // we reduce the quantity}.
    //if it's == 1 then we remove all entries
    if (_items[productId].quantity > 1) {
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: productId,
          imageUrl: existingCartItem.imageUrl,
          price: existingCartItem.price,
          title: existingCartItem.title,
          quantity: existingCartItem.quantity - 1,
        ),
      );
    } else {
      _items.remove(productId);
    }

    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
