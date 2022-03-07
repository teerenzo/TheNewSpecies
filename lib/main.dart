// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:thenewspecies/pages/home.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:thenewspecies/pages/splash.dart';
import 'package:thenewspecies/store/cart.dart';
import 'package:thenewspecies/store/chechOut.dart';
import 'package:thenewspecies/store/wishList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartStore>(create: (context) {
          return CartStore();
        }),
        ChangeNotifierProvider<WishListStore>(create: (context) {
          return WishListStore();
        }),
        ChangeNotifierProvider<CheckOutStore>(create: (context) {
          return CheckOutStore();
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
      ),
    );
  }
}
