// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:newspecies/components/cart_products.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newspecies/pages/account.dart';
import 'package:newspecies/pages/checkOut.dart';
import 'package:newspecies/store/cart.dart';
import 'package:newspecies/store/chechOut.dart';

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
                      child: Consumer<CheckOutStore>(
                        builder: (context, checkOutProduct, child) =>
                            MaterialButton(
                          onPressed: () {
                            getData().then((value) {
                              print(value);
                              if (value) {
                                checkOutProduct.removeAll();
                                cart.itemList.forEach((element) {
                                  checkOutProduct.add(element);
                                });
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return CheckOut();
                                }));
                              } else {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return UserAccount(
                                    path: "cart",
                                  );
                                }));
                              }
                            });
                          },
                          color: HexColor("9D0208"),
                          child: Text(
                            'CheckOut',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Future<bool> getData() async {
    String names = '',
        neighborhood = '',
        neighborhoodDetails = '',
        phone = '',
        email = '';

    var prefs = await SharedPreferences.getInstance();
    setState(() {
      names = prefs.getString("names").toString();
      neighborhood = prefs.getString("neighborhood").toString();
      neighborhoodDetails = prefs.getString("neighborhoodDetails").toString();
      email = prefs.getString("email").toString();
      phone = "rtoString()";
    });
    print(names);

    if (phone.toString() == "null" || names.toString() == "null") {
      return false;
    } else {
      return true;
    }
  }
}
