import 'package:flutter/cupertino.dart';

class Cart with ChangeNotifier {
  int quantity;
  String imgUrl;
  double price;
  String productId;
  String title;

  Cart(
      {required this.imgUrl,
      required this.quantity,
      required this.price,
      required this.productId,
      required this.title});
}

class Carts with ChangeNotifier {
  List<Cart> _carts = [];

  List<Cart> get carts {
    return [..._carts];
  }

  double get total {
    double tot = 0.0;
    if (_carts.isEmpty) return 0.0;
    for (int i = 0; i < _carts.length; i++) {
      tot += (_carts[i].quantity * _carts[i].price);
    }
    return tot;
  }

  void clear() {
    _carts = [];
    notifyListeners();
  }

  void addCart(String imgurl, String productId, double price, String title) {
    for (int i = 0; i < _carts.length; i++) {
      if (_carts[i].productId == productId) {
        _carts[i].quantity++;
        notifyListeners();
        return;
      }
    }
    _carts.insert(
        0,
        Cart(
            imgUrl: imgurl,
            quantity: 1,
            price: price,
            productId: productId,
            title: title));
    notifyListeners();
  }

  int get length {
    return _carts.length;
  }

  void remove(String id) {
    _carts.removeWhere((element) => element.productId == id);
    notifyListeners();
  }

  void removeSingle(String id) {
    for (int i = 0; i < _carts.length; i++) {
      if (_carts[i].productId == id) {
        if (_carts[i].quantity > 1) {
          _carts[i].quantity--;
          notifyListeners();
          return;
        }
        remove(id);
      }
    }
  }
}
