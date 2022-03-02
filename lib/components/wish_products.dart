import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
// import 'package:thenewspecies/model/product.dart';
import 'package:thenewspecies/store/cart.dart';
import 'package:thenewspecies/store/wishList.dart';

import '../model/product.dart';

// ignore: use_key_in_widget_constructors
class WishProducts extends StatefulWidget {
  @override
  _WishProductsState createState() => _WishProductsState();
}

class _WishProductsState extends State<WishProducts> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WishListStore>(
      builder: (context, wishList, child) => wishList.count <= 0
          ? Center(
              child: Text("Wish List is Empty"),
            )
          : ListView.builder(
              itemCount: wishList.count,
              itemBuilder: (context, index) {
                return SingleWishProduct(
                    prodName: wishList.itemList[index].prodName,
                    prodImage: wishList.itemList[index].prodImage,
                    prodColor: "red",
                    prodSize: "M",
                    price: wishList.itemList[index].price,
                    prodQuantity: wishList.itemList[index].quantity,
                    index: index);
              }),
    );
  }
}

class SingleWishProduct extends StatelessWidget {
  final prodName;
  final prodImage;
  final price;
  final prodSize;
  final prodColor;
  final prodQuantity;
  final index;

  SingleWishProduct(
      {this.prodName,
      this.prodImage,
      this.prodColor,
      this.price,
      this.prodQuantity,
      this.prodSize,
      this.index});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Consumer<WishListStore>(
        builder: (context, wishList, child) => ListTile(
            leading: Image.network(prodImage),
            title: Text(prodName),
            subtitle: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$price RWF",
                        style: TextStyle(
                          color: HexColor("9D0208"),
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                      ),
                      Consumer<CartStore>(
                        builder: (context, cart, child) => new IconButton(
                          icon: Icon(Icons.add_shopping_cart),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  // title: Text('Quantity'),
                                  content: Text('Product added to Cart'),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(context);
                                      },
                                      child: Text('close'),
                                    ),
                                  ],
                                );
                              },
                            );
                            cart.add(
                              Product(prodName, prodImage, "0", price, 1),
                            );
                          },
                          color: HexColor("9D0208"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                wishList.removeItem(wishList.itemList[index]);
              },
            )),
      ),
    );
  }

  void addQty(index) {}
}
