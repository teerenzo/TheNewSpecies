import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:thenewspecies/model/product.dart';
import 'package:thenewspecies/store/cart.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartStore>(
      builder: (context, cart, child) => cart.count <= 0
          ? Center(
              child: Text("Cart is Empty"),
            )
          : ListView.builder(
              itemCount: cart.count,
              itemBuilder: (context, index) {
                return SingleCartProduct(
                    prodName: cart.itemList[index].prodName,
                    prodImage: cart.itemList[index].prodImage,
                    prodColor: "red",
                    prodSize: "M",
                    price: cart.itemList[index].price,
                    prodQuantity: cart.itemList[index].quantity,
                    index: index);
              }),
    );
  }
}

class SingleCartProduct extends StatelessWidget {
  final prodName;
  final prodImage;
  final price;
  final prodSize;
  final prodColor;
  final prodQuantity;
  final index;

  SingleCartProduct(
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
      child: Consumer<CartStore>(
        builder: (context, cart, child) => ListTile(
            leading: Image.network(prodImage),
            title: Text(prodName),
            subtitle: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$price Rwf",
                        style: TextStyle(
                          color: HexColor("9D0208"),
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     Text("Size:"),
                      //     Text(
                      //       prodSize,
                      //       style: TextStyle(
                      //         color: HexColor("9D0208"),
                      //       ),
                      //     ),
                      //   ],
                      // ),

                      Row(
                        children: [
                          Consumer<CartStore>(
                            builder: (context, cart, child) => IconButton(
                              onPressed: () {
                                cart.addQty(index);
                              },
                              icon: Icon(
                                Icons.add,
                                size: 15,
                                color: HexColor("9D0208"),
                              ),
                            ),
                          ),
                          Text(
                            "$prodQuantity",
                            style: TextStyle(color: Colors.black),
                          ),
                          Consumer<CartStore>(
                            builder: (context, cart, child) => IconButton(
                              onPressed: () {
                                cart.reduceQty(index);
                              },
                              icon: Icon(
                                Icons.remove,
                                size: 15,
                                color: HexColor("9D0208"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Container(
                  //   alignment: Alignment.topLeft,
                  //   child:
                  // ),
                ],
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                cart.removeItem(cart.itemList[index]);
              },
            )),
      ),
    );
  }

  void addQty(index) {}
}
