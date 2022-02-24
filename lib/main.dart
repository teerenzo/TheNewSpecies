// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:thenewspecies/pages/home.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:thenewspecies/store/cart.dart';

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
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
