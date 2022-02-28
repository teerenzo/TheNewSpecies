import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'package:provider/provider.dart';
import 'package:thenewspecies/model/product.dart';

class CartStore extends ChangeNotifier {
  List<Product> items = [];

  double amount = 0;
  void add(Product item) {
    final index =
        items.indexWhere((element) => element.prodName == item.prodName);
    if (index != -1) {
      items[index].quantity += 1;
    } else {
      items.add(item);
    }
    amount += double.parse(item.price);

    notifyListeners();
  }

  void removeItem(Product item) {
    final index =
        items.indexWhere((element) => element.prodName == item.prodName);
    var qty = items[index].quantity;
    amount -= double.parse(item.price) * qty;
    items.remove(item);
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

  void addQty(index) {
    items[index].quantity += 1;
    amount += double.parse(items[index].price);
    notifyListeners();
  }

  void reduceQty(index) {
    if (items[index].quantity > 1) {
      items[index].quantity -= 1;
      amount -= double.parse(items[index].price);
    }
    notifyListeners();
  }
}
