import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:newspecies/model/product.dart';
import 'package:newspecies/store/cart.dart';

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
                    product: cart.itemList[index], index: index);
              }),
    );
  }
}

class SingleCartProduct extends StatelessWidget {
  Product product;
  final index;

  SingleCartProduct({required this.product, this.index});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Consumer<CartStore>(
        builder: (context, cart, child) => ListTile(
            leading: Image.network("${product.images![0].src}"),
            title: Text("${product.name}"),
            subtitle: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${product.price} Rwf",
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

                      Column(
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
                            "${product.quantity}",
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
