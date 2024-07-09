import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  List<String> _cartItems = [];
  List<bool> _isCheckedList = [];

  List<String> get cartItems => _cartItems;
  List<bool> get isCheckedList => _isCheckedList;

  void addToCart(String item) {
    _cartItems.add(item);
    _isCheckedList.add(false);
    notifyListeners();
  }

 void removeFromCart() {
  for (int i = _isCheckedList.length - 1; i >= 0; i--) {
    if (_isCheckedList[i]) {
      _cartItems.removeAt(i);
      _isCheckedList.removeAt(i);
    }
  }
  notifyListeners();
}

  void toggleChecked(int index) {
    _isCheckedList[index] = !_isCheckedList[index];
    notifyListeners();
  }
}