// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thenewspecies/components/cart_products.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:thenewspecies/store/cart.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("F2E5E5"),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: HexColor("9D0208"),
        title: Text('Cart'),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: null),
        ],
      ),
      body: CartProducts(),
      bottomNavigationBar: Consumer<CartStore>(
        builder: (context, cart, child) => cart.count <= 0
            ? Container(
                child: Center(
                  child: Text("Cart is Empty"),
                ),
              )
            : Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text('Total'),
                        subtitle: Text("${cart.totalAmount} /Rwf"),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        color: HexColor("9D0208"),
                        child: Text(
                          'CheckOut',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
