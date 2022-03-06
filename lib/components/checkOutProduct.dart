import 'package:flutter/material.dart';
import 'package:thenewspecies/model/product.dart';

import '../store/chechOut.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';

class CheckOutProduct extends StatefulWidget {
  const CheckOutProduct({Key? key}) : super(key: key);

  @override
  State<CheckOutProduct> createState() => _CheckOutProductState();
}

class _CheckOutProductState extends State<CheckOutProduct> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CheckOutStore>(
      builder: (context, chechOut, child) => chechOut.count <= 0
          ? Center(
              child: Text("Cart is Empty"),
            )
          : Container(
              height: 160,
              child: ListView.builder(
                  itemCount: chechOut.count,
                  itemBuilder: (context, index) {
                    return SingleChechOutProduct(
                        product: chechOut.itemList[index], index: index);
                  }),
            ),
    );
  }
}

class SingleChechOutProduct extends StatelessWidget {
  Product product;
  final index;

  SingleChechOutProduct({required this.product, this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Consumer<CheckOutStore>(
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
                        Text(
                          "${product.quantity}",
                          style: TextStyle(color: Colors.black),
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
        ),
      ),
    );
  }
}
