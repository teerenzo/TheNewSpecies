import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'package:provider/provider.dart';
import 'package:newspecies/model/product.dart';

class CartStore extends ChangeNotifier {
  List<Product> items = [];

  double amount = 0;
  void add(Product item) {
    final index = items.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      items[index].quantity = items[index].quantity!.toInt() + 1;
    } else {
      items.add(item);
    }
    amount += double.parse(item.price.toString());

    notifyListeners();
  }

  void removeItem(Product item) {
    final index = items.indexWhere((element) => element.name == item.name);
    var qty = items[index].quantity!.toInt();
    amount -= double.parse(item.price.toString()) * qty;
    item.quantity = 1;
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
    items[index].quantity = items[index].quantity!.toInt() + 1;
    amount += double.parse(items[index].price.toString());
    notifyListeners();
  }

  void reduceQty(index) {
    if (items[index].quantity!.toInt() > 1) {
      items[index].quantity = items[index].quantity!.toInt() - 1;
      amount -= double.parse(items[index].price.toString());
    }
    notifyListeners();
  }
}
