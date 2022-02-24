import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:thenewspecies/model/product.dart';

class ProductsStore extends ChangeNotifier {
  List<Product> products = [];
  // double price = 0;
  set product(Product product) {
    products.add(product);
    notifyListeners();
  }

  List<Product> get productList {
    return products;
  }

  int get count {
    return products.length;
  }
}
