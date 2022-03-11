import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'package:provider/provider.dart';
import 'package:newspecies/model/product.dart';

class WishListStore extends ChangeNotifier {
  List<Product> items = [];

  // double amount = 0;
  void add(Product item) {
    // print("ok");
    final index = items.indexWhere((element) => element.name == item.name);
    if (index != -1) {
      print(items[index]);
      items.remove(item);
    } else {
      items.add(item);
      // amount += double.parse(item.price);
    }
    // items.map((e) => amount = amount + double.parse(e.price));
    notifyListeners();
  }

  void removeItem(Product item) {
    items.remove(item);
    // amount -= double.parse(item.price);
    notifyListeners();
  }

  List<Product> get itemList {
    return items;
  }

  int get count {
    return items.length;
  }

  bool exist(item) {
    if (items.indexWhere((element) => element.name == item.name) == -1) {
      return false;
    } else {
      return true;
    }
  }

  // double get totalAmount {
  //   return amount;
  // }

  // void addQty(index) {
  //   items[index].quantity += 1;
  //   amount += double.parse(items[index].price);
  //   notifyListeners();
  // }

  // void reduceQty(index) {
  //   if (items[index].quantity > 1) {
  //     items[index].quantity -= 1;
  //     amount -= double.parse(items[index].price);
  //   }
  //   notifyListeners();
  // }
}
