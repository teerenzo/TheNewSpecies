import 'package:flutter/material.dart';
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

class ProductDetails extends StatefulWidget {
  Product product;
  // final productDetailName;
  // final productDetailImage;
  // final productDetailPrice;
  // final productDetailOldPrice;

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
                      title: Text(
                        "${widget.product.name}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight * 0.018,
                        ),
                      ),
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
          //======the first buttons =======
          Row(
            children: [
              Expanded(
                child: Text("\Rwf${widget.product.price}",
                    style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough)),
              ),
              Expanded(
                child: Text(
                  "\Rwf${widget.product.price}",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //======the sise button======
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
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return CheckOut();
                      }));
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
          // Container(
          //   height: 260.0,
          //   child: SimilarProduct(),
          // )
        ],
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

// class SimilarProduct extends StatefulWidget {
//   @override
//   _SimilarProductState createState() => _SimilarProductState();
// }

// class _SimilarProductState extends State<SimilarProduct> {
//   var productsList = [
//     {
//       'prodName': 'blazer',
//       'prodImage': 'images/products/blazer1.jpeg',
//       'oldPrice': '120',
//       'price': '90',
//     },
//     {
//       'prodName': 'Pant',
//       'prodImage': 'images/products/pants2.jpeg',
//       'oldPrice': '90',
//       'price': '81',
//     },
//     {
//       'prodName': 'Red dress',
//       'prodImage': 'images/products/dress1.jpeg',
//       'oldPrice': '180',
//       'price': '140',
//     },
//     {
//       'prodName': 'blazer 2',
//       'prodImage': 'images/products/blazer2.jpeg',
//       'oldPrice': '200',
//       'price': '180',
//     },
//     {
//       'prodName': 'dress',
//       'prodImage': 'images/products/dress2.jpeg',
//       'oldPrice': '180',
//       'price': '170',
//     },
//     {
//       'prodName': 'skt',
//       'prodImage': 'images/products/skt1.jpeg',
//       'oldPrice': '180',
//       'price': '170',
//     },
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         itemCount: productsList.length,
//         gridDelegate:
//             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
//         itemBuilder: (BuildContext context, int index) {
//           return SimilarSingleProd(
//             prodName: productsList[index]['prodName'],
//             prodImage: productsList[index]['prodImage'],
//             oldPrice: productsList[index]['oldPrice'],
//             price: productsList[index]['price'],
//           );
//         });
//   }
// }

// class SimilarSingleProd extends StatelessWidget {
//   final prodName;
//   final prodImage;
//   final oldPrice;
//   final price;
//   SimilarSingleProd({this.prodName, this.prodImage, this.oldPrice, this.price});
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Hero(
//         tag: prodName,
//         child: Material(
//           child: InkWell(
//             onTap: () => Navigator.of(context).push(MaterialPageRoute(
//                 //here we are passing the data of product
//                 builder: (context) => ProductDetails(
//                    product: ,
//                     ))),
//             child: GridTile(
//                 footer: Container(
//                   color: Colors.white70,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           prodName,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16.0,
//                           ),
//                         ),
//                       ),
//                       Text(
//                         "\$$price",
//                         style: TextStyle(
//                           color: Colors.red,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 child: Image.asset(
//                   prodImage,
//                   fit: BoxFit.cover,
//                 )),
//           ),
//         ),
//       ),
//     );
//   }
// }
