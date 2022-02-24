import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'package:provider/provider.dart';
import 'package:thenewspecies/model/product.dart';

class CartStore extends ChangeNotifier {
  List<Product> items = [];
  double amount = 0;
  void add(Product item) {
    items.add(item);
    items.map((e) => amount = amount + double.parse(e.price));
    notifyListeners();
  }

  void removeItem(Product item) {
    items.remove(item);
    notifyListeners();
  }

  List<Product> get itemList {
    return items;
  }

  int get count {
    return items.length;
  }
}
