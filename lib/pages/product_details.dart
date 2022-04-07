import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:newspecies/components/bottomNavigation.dart';
import 'package:newspecies/model/product.dart';
import 'package:newspecies/pages/account.dart';
import 'package:newspecies/pages/cart.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:newspecies/pages/checkOut.dart';
import 'package:newspecies/store/cart.dart';
import 'package:newspecies/store/chechOut.dart';
import 'package:newspecies/store/wishList.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:url_launcher/url_launcher.dart';

class ProductDetails extends StatefulWidget {
  Product product;

  ProductDetails({required this.product});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double size = MediaQuery.of(context).size.width;
    List<NetworkImage> _imgs = [];

    List<Images>? images = widget.product.images;
    var images2 = [];
    for (var i = 0; i < widget.product.images!.length; i++) {
      _imgs.add(NetworkImage("${widget.product.images![i].src}"));
    }

    print(_imgs);

    Widget ImageCarousel = Container(
      color: Colors.white,
      height: screenHeight / 6,
      child: Carousel(
        boxFit: BoxFit.fitHeight,
        images: _imgs,
        autoplay: true,
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 2000),
      ),
    );
    return Scaffold(
      backgroundColor: HexColor("F2E5E5"),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: HexColor("9D0208"),
        title: Text("${widget.product.name}"),
        actions: [
          IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: null),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Cart(),
                ),
              );
            },
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBtn(),
      body: ListView(
        children: [
          Container(
            height: 300.0,
            child: GridTile(
              child: ImageCarousel,
              footer: Column(
                children: [
                  Container(
                    color: Colors.white70,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "${widget.product.name}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenHeight * 0.018,
                              ),
                            ),
                            // Expanded(
                            //   child: Text("\Rwf${widget.product.price}",
                            //       style: TextStyle(
                            //           color: Colors.grey,
                            //           decoration: TextDecoration.lineThrough)),
                            // ),
                            Text(
                              "${widget.product.price} RWF",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Expanded(
                            //   child: MaterialButton(
                            //     onPressed: () {
                            //       showDialog(
                            //         context: context,
                            //         builder: (context) {
                            //           return AlertDialog(
                            //             title: Text('Size'),
                            //             content: Text('choose the size'),
                            //             actions: [
                            //               MaterialButton(
                            //                 onPressed: () {
                            //                   Navigator.of(context).pop(context);
                            //                 },
                            //                 child: Text('close'),
                            //               ),
                            //             ],
                            //           );
                            //         },
                            //       );
                            //     },
                            //     color: Colors.white,
                            //     textColor: Colors.grey,
                            //     elevation: 0.2,
                            //     child: Row(
                            //       children: [
                            //         Expanded(
                            //           child: Text('Size'),
                            //         ),
                            //         Expanded(
                            //           child: Icon(Icons.arrow_drop_down),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),

                            //======the sise button======
                            // Expanded(
                            //   child: MaterialButton(
                            //     onPressed: () {
                            //       showDialog(
                            //         context: context,
                            //         builder: (context) {
                            //           return AlertDialog(
                            //             title: Text('Color'),
                            //             content: Text('choose a color'),
                            //             actions: [
                            //               MaterialButton(
                            //                 onPressed: () {
                            //                   Navigator.of(context).pop(context);
                            //                 },
                            //                 child: Text('close'),
                            //               ),
                            //             ],
                            //           );
                            //         },
                            //       );
                            //     },
                            //     color: Colors.white,
                            //     textColor: Colors.grey,
                            //     elevation: 0.2,
                            //     child: Row(
                            //       children: [
                            //         Expanded(
                            //           child: Text('Color'),
                            //         ),
                            //         Expanded(
                            //           child: Icon(Icons.arrow_drop_down),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),

                            //======the sise button======
                            // Expanded(
                            //   child: MaterialButton(
                            //     onPressed: () {
                            //       showDialog(
                            //         context: context,
                            //         builder: (context) {
                            //           return AlertDialog(
                            //             title: Text('Quantity'),
                            //             content: Text('choose quantity'),
                            //             actions: [
                            //               MaterialButton(
                            //                 onPressed: () {
                            //                   Navigator.of(context).pop(context);
                            //                 },
                            //                 child: Text('close'),
                            //               ),
                            //             ],
                            //           );
                            //         },
                            //       );
                            //     },
                            //     color: Colors.white,
                            //     textColor: Colors.grey,
                            //     elevation: 0.2,
                            //     child: Row(
                            //       children: [
                            //         Expanded(
                            //           child: Text('Quantity'),
                            //         ),
                            //         Expanded(
                            //           child: Icon(Icons.arrow_drop_down),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),

                      // Text(
                      //   "${widget.product.name}",
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: screenHeight * 0.018,
                      //   ),
                      // ),
                      // title: Row(
                      //   children: [
                      //     Expanded(
                      //       child: Text("\$${widget.product.price}",
                      //           style: TextStyle(
                      //               color: Colors.grey,
                      //               decoration: TextDecoration.lineThrough)),
                      //     ),
                      //     Expanded(
                      //       child: Text(
                      //         "\$${widget.product.price}",
                      //         style: TextStyle(
                      //           color: Colors.red,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              //======the sise button======
              Expanded(
                child: Consumer<CheckOutStore>(
                  builder: (context, checkOutProduct, child) => MaterialButton(
                    onPressed: () {
                      print("clicked");
                      checkOutProduct.removeAll();
                      checkOutProduct.add(widget.product);
                      getData().then((value) {
                        print(value);
                        if (value) {
                          checkOutProduct.removeAll();
                          checkOutProduct.add(widget.product);
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return CheckOut();
                          }));
                        } else {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return UserAccount(
                              path: "product",
                            );
                          }));
                        }
                      });
                    },
                    color: HexColor("9D0208"),
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: Text('Buy Now'),
                  ),
                ),
              ),

              Consumer<CartStore>(
                builder: (context, cart, child) => new IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // title: Text('Quantity'),
                          content: Text('Product added to Cart'),
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
                    cart.add(widget.product);
                  },
                  color: HexColor("9D0208"),
                ),
              ),

              Consumer<WishListStore>(
                builder: (context, wishList, child) => new IconButton(
                  icon: wishList.exist(widget.product)
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border),
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
                    wishList.add(
                      widget.product,
                    );
                  },
                  color: HexColor("9D0208"),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Consumer<CheckOutStore>(
                  builder: (context, checkOutProduct, child) => MaterialButton(
                    onPressed: () {
                      String name = widget.product.name.toString();
                      name = name.replaceAll(" ", "-");
                      String msg =
                          "Hello , i want to buy \n \n ${widget.product.name} \n Price: ${widget.product.price}RWF \n URL: https://thenewspecies.com/product/$name/  \n \n \n \n Thank you!";

                      share(msg);
                      // print("clicked");
                      // checkOutProduct.removeAll();
                      // checkOutProduct.add(widget.product);
                      // getData().then((value) {
                      //   print(value);
                      //   if (value) {
                      //     checkOutProduct.removeAll();
                      //     checkOutProduct.add(widget.product);
                      //     Navigator.of(context)
                      //         .push(MaterialPageRoute(builder: (context) {
                      //       return CheckOut();
                      //     }));
                      //   } else {
                      //     Navigator.of(context)
                      //         .push(MaterialPageRoute(builder: (context) {
                      //       return UserAccount(
                      //         path: "product",
                      //       );
                      //     }));
                      //   }
                      // });
                      // Navigator.of(context)
                      //     .push(MaterialPageRoute(builder: (context) {
                      //   return CheckOut();
                      // }));
                    },
                    color: Colors.green,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: Text('Order via Whatsapp'),
                  ),
                ),
              ),
            ],
          ),
          Divider(),
          ListTile(
            title: Text(
              'Descriptions',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text("${widget.product.description}"),
          ),
          Divider(),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product Condiction',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                //fix Later
                child: Text("condiction"),
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Similar Products'),
          ),
          Container(
            height: 260.0,
            child: SimilarProduct(),
          )
        ],
      ),
    );
  }

  Future<void> share(String msg) async {
    String tel = "+250788881444";

    String url = "whatsapp://send?phone=$tel&text=$msg";
    await canLaunch(url) ? launch(url) : print("no lanff");
    // await WhatsappShare.share(
    //   text: 'Example share text',
    //   linkUrl: 'https://flutter.dev/',
    //   phone: '+250780591269',
    // );
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

class SimilarProduct extends StatefulWidget {
  // Product product;
  // SimilarProduct({required this.product});
  @override
  _SimilarProductState createState() => _SimilarProductState();
}

class _SimilarProductState extends State<SimilarProduct> {
  bool isLoading = true;
  List<Product> productsList = <Product>[];
  fetchCategory() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://newspeciesendpointswoocomerce.herokuapp.com/productsBycategory'));
    request.body = json.encode({"per_page": 10, "category": 39});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonData = convert.jsonDecode(await response.stream.bytesToString());
      for (var item in jsonData) {
        Product productModel = Product.fromJson(item);

        productsList.add(productModel);
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
    print(productsList);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: SpinKitFadingCircle(
              color: HexColor("#9D0208"),
              size: 30.0,
            ),
          )
        : GridView.builder(
            itemCount: productsList.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return SimilarSingleProd(product: productsList[index]);
            });
  }
}

class SimilarSingleProd extends StatelessWidget {
  Product product;
  SimilarSingleProd({required this.product});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: product.name.toString(),
        child: Material(
          child: InkWell(
            // onTap: () => Navigator.of(context).push(MaterialPageRoute(
            //     //here we are passing the data of product
            //     builder: (context) => ProductDetails(
            //        product: ,
            //         ))),
            child: GridTile(
                footer: Container(
                  color: Colors.white70,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.name.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Text(
                        "${product.price}/ rwf",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
                child: Image.asset(
                  "${product.images![0].src}",
                  fit: BoxFit.cover,
                )),
          ),
        ),
      ),
    );
  }
}
