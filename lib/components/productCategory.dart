import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newspecies/components/products.dart';
import 'package:newspecies/model/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:hexcolor/hexcolor.dart';
import 'package:newspecies/pages/home.dart';
import 'package:newspecies/pages/product_details.dart';
import 'package:newspecies/store/cart.dart';
import 'package:newspecies/store/wishList.dart';
import 'package:provider/provider.dart';

class CategoryProduct extends StatefulWidget {
  int categoryId;
  CategoryProduct({required this.categoryId});

  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  // var categories = [];
  bool isLoading = true;
  List<Product> product = <Product>[];

  fetchCategory() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://newspeciesappendpoints.herokuapp.com/productsBycategory'));
    request.body = json.encode({"per_page": 10, "category": widget.categoryId});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonData = convert.jsonDecode(await response.stream.bytesToString());
      for (var item in jsonData) {
        Product productModel = Product.fromJson(item);

        product.add(productModel);
        setState(() {
          // Consumer<CartStore>(
          //   builder: (context, value, child) {
          //       value.add(productModel);
          //   },
          // );
          CartStore store = CartStore();
          store.items;
        });
      }
      setState(() {
        // categories = jsonData;

        isLoading = false;
      });
      print(jsonData);
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print("dsjfgdsj sdafghjadsf");
    this.fetchCategory();
    print(product);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return isLoading
        ? Center(
            child: SpinKitFadingCircle(
              color: HexColor("#9D0208"),
              size: 30.0,
            ),
          )
        : Container(
            padding: EdgeInsets.only(left: 8, right: 8),
            height: screenHeight / 3,
            width: MediaQuery.of(context).size.width / 2,
            child: ListView.builder(
              itemCount: product.length,
              itemBuilder: (context, index) {
                return ProductBack(product: product[index]);
              },
              scrollDirection: Axis.horizontal,
            ),
          );
  }
}

class ProductBySpecific extends StatelessWidget {
  Product product;
  ProductBySpecific({required this.product});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // return Text("${product.name.toString()}");
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      child: Card(
        child: Hero(
          tag: 'hjghjgh',
          child: Material(
            shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            )),
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  //here we are passing the data of product
                  builder: (context) => ProductDetails(
                        product: product,
                      ))),
              child: GridTile(
                  // header: Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text(
                  //           "${product.price}Rwf",
                  //           style: TextStyle(
                  //             color: HexColor("9D0208"),
                  //           ),
                  //         ),
                  //         Consumer<WishListStore>(
                  //           builder: (context, wishList, child) => IconButton(
                  //             icon: wishList.exist(
                  //               product,
                  //             )
                  //                 ? Icon(
                  //                     Icons.favorite,
                  //                     color: HexColor("9D0208"),
                  //                     size: 20,
                  //                   )
                  //                 : Icon(
                  //                     Icons.favorite_border,
                  //                     color: HexColor("9D0208"),
                  //                     size: 20,
                  //                   ),
                  //             onPressed: () {
                  //               showDialog(
                  //                 context: context,
                  //                 builder: (context) {
                  //                   return AlertDialog(
                  //                     // title: Text('Quantity'),
                  //                     content:
                  //                         Text('Product added to wishlist'),
                  //                     actions: [
                  //                       MaterialButton(
                  //                         onPressed: () {
                  //                           Navigator.of(context).pop(context);
                  //                         },
                  //                         child: Text('close'),
                  //                       ),
                  //                     ],
                  //                   );
                  //                 },
                  //               );
                  //               wishList.add(product);
                  //             },
                  //           ),
                  //         )
                  //       ]),
                  // ),
                  footer: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${product.name}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight / 62,
                        ),
                      ),
                    ),
                  ),
                  child: Image.network(
                    "${product.images![0].src}",
                    // fit: BoxFit.cover,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
