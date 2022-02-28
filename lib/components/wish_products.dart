import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
// import 'package:thenewspecies/model/product.dart';
import 'package:thenewspecies/store/cart.dart';
import 'package:thenewspecies/store/wishList.dart';

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
                      Row(
                        children: [
                          Text("Size:"),
                          Text(
                            prodSize,
                            style: TextStyle(
                              color: HexColor("9D0208"),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Color:"),
                          Text(
                            prodColor,
                            style: TextStyle(
                              color: HexColor("9D0208"),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "\$$price",
                      style: TextStyle(
                        color: HexColor("9D0208"),
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                      ),
                    ),
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
