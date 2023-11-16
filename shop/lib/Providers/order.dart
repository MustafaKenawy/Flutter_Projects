import 'package:flutter/cupertino.dart';
import 'package:shop/Providers/cart.dart';

class Order {
  DateTime date;
  double amount;
  List<Cart> carts;

  Order({required this.carts,required this.amount,required this.date,});


}


class Orders with ChangeNotifier{

  List<Order> _orders=[];

  List<Order> get orders {
    return [..._orders];
  }

  void remove (DateTime date)
  {
    _orders.removeWhere((element) => element.date == date);
    notifyListeners();
  }


  void placeOrder (double amount,List<Cart> carts){
    _orders.insert(0, Order(date: DateTime.now(),amount: amount,carts: carts));
    notifyListeners();
  }

}