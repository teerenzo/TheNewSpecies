import 'package:flutter/material.dart';
import 'package:newspecies/model/product.dart';

class CheckOutStore extends ChangeNotifier {
  List<Product> items = [];
  double amount = 0;
  void add(Product item) {
    final index = items.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      items[index].quantity = 1;
    } else {
      items.add(item);
      amount += double.parse(item.price.toString()) *
          int.parse(item.quantity.toString());
    }
    // items.add(item);

    notifyListeners();
  }

  void removeAll() {
    // items.forEach(
    //   (element) => element.quantity = 1,
    // );
    items.clear();
    amount = 0;

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
