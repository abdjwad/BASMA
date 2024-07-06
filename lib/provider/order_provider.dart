import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  List<Map<String, dynamic>> _orders = [
    // Add your initial orders here if any
  ];

  List<Map<String, dynamic>> get orders => _orders;

  void addOrder(Map<String, dynamic> newOrder) {
    _orders.add(newOrder);
    notifyListeners();
  }

  void removeOrder(int index) {
    _orders.removeAt(index);
    notifyListeners();
  }

  void completeOrder(int index) {
    _orders[index]['status'] = 'منجز';
    notifyListeners();
  }
}
