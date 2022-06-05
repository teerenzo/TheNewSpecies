// import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:newspecies/model/product.dart';
import 'package:newspecies/pages/product_details.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newspecies/store/cart.dart';
import 'package:newspecies/store/wishList.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<Product> products = <Product>[];
  bool isLoading = true;
  late Product product;
  late List<Product> product1;
//   List<ac.Anime> animeList = new List<ac.Anime>();
// for(var item in jsonData){
//     ac.Anime anime = ac.Anime.fromJson(item);
//     animeList.add(item);
// }

  void fetchProducts() async {
    // var connectivityResult = await (Connectivity().checkConnectivity());
    // bool isConnected = false;
    // if (connectivityResult == ConnectivityResult.mobile) {
    //   isConnected = true;
    // } else if (connectivityResult == ConnectivityResult.wifi) {
    //   isConnected = true;
    // }
    // if (isConnected) {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://newspeciesappendpoints.herokuapp.com/products'));
    request.body = '''{\n    "per_page":100\n}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonData = convert.jsonDecode(await response.stream.bytesToString());

      for (var item in jsonData) {
        Product product = Product.fromJson(item);
        if (product.images!.length > 0) {
          products.add(product);
        }
        // products.add(product);
      }

      print(products);
      //  product = Product.fromJson(indexedData);
      // product1.add(product);r
      // print(indexedData[2]);
      setState(() {
        // products = product as List;
        isLoading = false;
      });
      // return products;
      // print(jsonData);
    } else {
      print(response.reasonPhrase);
      // return products;
    }
    // } else {
    //   return showDialog(
    //     context: context,
    //     builder: (ctx) => AlertDialog(
    //       title: Text("Network Error"),
    //       content: Text(""),
    //       actions: <Widget>[
    //         FlatButton(
    //           onPressed: () {
    //             setState(() {
    //               isLoading = false;
    //             });
    //             Navigator.of(ctx).pop();
    //           },
    //           child: Text("close"),
    //         ),
    //       ],
    //     ),
    //   );
    // }
    //
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchProducts();
  }

  var productsList = [
    {
      'prodName': 'blazer',
      'prodImage': 'images/products/blazer1.jpeg',
      'oldPrice': '120',
      'price': '90',
    },
  ];
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
        // : FutureBuilder<List<Product>>(
        //     future: fetchProducts(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         return GridView.builder(
        //             itemCount: 100,
        //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //                 crossAxisCount: 2),
        //             itemBuilder: (BuildContext context, int index) {
        //               return Consumer<CartStore>(
        //                 builder: (context, cart, child) => SingleProd(
        //                   product: snapshot.data,
        //                 ),
        //               );
        //             });
        //       } else {
        //         return CircularProgressIndicator();
        //       }
        //     });
        : Container(
            padding: EdgeInsets.all(16),
            height: screenHeight,
            child: StaggeredGridView.countBuilder(
              // scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: products.length,
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Consumer<CartStore>(
                    builder: (context, cart, child) => SingleProd(
                      product: products[index],
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              // staggeredTileBuilder: (index) => StaggeredTile.count(
              //     (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
            ),
          );
  }
}

class SingleProd extends StatelessWidget {
  Product product;
  // final prodName;
  // final prodImage;
  // final oldPrice;
  // final price;

  SingleProd({required this.product});
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    String proname = product.name.toString();
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: Card(
        child: Material(
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
            Radius.circular(30),
          )),
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                //here we are passing the data of product
                builder: (context) => ProductDetails(
                      product: product,
                    ))),
            child: Column(
              children: [
                Row(
                  children: [
                    Consumer<WishListStore>(
                      builder: (context, wishList, child) => IconButton(
                        icon: wishList.exist(
                          product,
                        )
                            ? Icon(
                                Icons.favorite,
                                color: HexColor("9D0208"),
                                size: 20,
                              )
                            : Icon(
                                Icons.favorite_border,
                                color: HexColor("9D0208"),
                                size: 20,
                              ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                // title: Text('Quantity'),
                                content: Text('Product added to wishlist'),
                                actions: [
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(context);
                                    },
                                    child: Text('close'),
                                  ),
                                ],
                              );
                            },
                          );
                          wishList.add(product);
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 150,
                  child: Image.network(
                    "${product.images![0].src}",
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "${product.price} RWF",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
                Text(
                  "${proname.length > 20 ? proname : proname}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // return Card(
    //   child: Hero(
    //     tag:
    //         '${proname.length > 20 ? proname.substring(0, 20) + "..." : proname}',
    //     child: Material(
    //       shape: RoundedRectangleBorder(
    //           borderRadius: const BorderRadius.all(
    //         Radius.circular(16.0),
    //       )),
    //       child: InkWell(
    //         onTap: () => Navigator.of(context).push(MaterialPageRoute(
    //             //here we are passing the data of product
    //             builder: (context) => ProductDetails(
    //                   product: product,
    //                 ))),
    //         child: GridTile(
    //             header: Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     // Text(
    //                     //   "${product.price}Rwf",
    //                     //   style: TextStyle(
    //                     //     color: HexColor("9D0208"),
    //                     //   ),
    //                     // ),
    //                     Consumer<WishListStore>(
    //                       builder: (context, wishList, child) => IconButton(
    //                         icon: wishList.exist(
    //                           product,
    //                         )
    //                             ? Icon(
    //                                 Icons.favorite,
    //                                 color: HexColor("9D0208"),
    //                                 size: 20,
    //                               )
    //                             : Icon(
    //                                 Icons.favorite_border,
    //                                 color: HexColor("9D0208"),
    //                                 size: 20,
    //                               ),
    //                         onPressed: () {
    //                           showDialog(
    //                             context: context,
    //                             builder: (context) {
    //                               return AlertDialog(
    //                                 // title: Text('Quantity'),
    //                                 content: Text('Product added to wishlist'),
    //                                 actions: [
    //                                   MaterialButton(
    //                                     onPressed: () {
    //                                       Navigator.of(context).pop(context);
    //                                     },
    //                                     child: Text('close'),
    //                                   ),
    //                                 ],
    //                               );
    //                             },
    //                           );
    //                           wishList.add(product);
    //                         },
    //                       ),
    //                     )
    //                   ]),
    //             ),
    //             footer: Center(
    //               child: Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Text(
    //                   "${proname.length > 20 ? proname.substring(0, 17) + "..." : proname}",
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: screenHeight / 62,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             child: Image.network(
    //               "${product.images![0].src}",
    //               fit: BoxFit.cover,
    //             )),
    //       ),
    //     ),
    //   ),
    // );
  }
}
