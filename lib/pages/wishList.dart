// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:thenewspecies/components/WishList_products.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:thenewspecies/components/wish_products.dart';
// import 'package:thenewspecies/store/WishList.dart';

// import '../store/wishList.dart';

// ignore: use_key_in_widget_constructors
class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("F2E5E5"),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: HexColor("9D0208"),
        title: Text('Wish List'),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: null),
        ],
      ),
      body: WishProducts(),
    );
  }
}
