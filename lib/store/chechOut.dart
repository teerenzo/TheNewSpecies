import 'package:flutter/material.dart';
import 'package:thenewspecies/model/product.dart';

class CheckOutStore extends ChangeNotifier {
  List<Product> items = [];
  double amount = 0;
  void add(Product item) {
    items.add(item);
    amount += double.parse(item.price.toString());

    notifyListeners();
  }

  void removeAll() {
    items.clear();
    notifyListeners();
  }

  List<Product> get itemList {
    return items;
  }

  int get count {
    return items.length;
  }

  double get totalAmount {
    return amount;
  }
}
