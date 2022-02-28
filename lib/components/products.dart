import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thenewspecies/model/product.dart';
import 'package:thenewspecies/pages/product_details.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:thenewspecies/store/cart.dart';
import 'package:thenewspecies/store/wishList.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var products = [];
  bool isLoading = true;

  fetchProducts() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://newspeciesendpointswoocomerce.herokuapp.com/products'));
    request.body = '''{\n    "per_page":10\n}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonData = convert.jsonDecode(await response.stream.bytesToString());
      setState(() {
        products = jsonData;
        isLoading = false;
      });
      print(jsonData[0].images[0]);
    } else {
      print(response.reasonPhrase);
    }
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
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            itemCount: products.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return Consumer<CartStore>(
                builder: (context, cart, child) => SingleProd(
                  prodName: products[index]['name'],
                  prodImage: products[index]['images'][0]["src"],
                  oldPrice: "",
                  price: products[index]['price'],
                ),
              );
            });
  }
}

class SingleProd extends StatelessWidget {
  final prodName;
  final prodImage;
  final oldPrice;
  final price;
  SingleProd({this.prodName, this.prodImage, this.oldPrice, this.price});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prodName,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                //here we are passing the data of product
                builder: (context) => ProductDetails(
                      productDetailName: prodName,
                      productDetailImage: prodImage,
                      productDetailOldPrice: oldPrice,
                      productDetailPrice: price,
                    ))),
            child: GridTile(
                header: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${price}Rwf",
                          style: TextStyle(
                            color: HexColor("9D0208"),
                          ),
                        ),
                        Consumer<WishListStore>(
                          builder: (context, wishList, child) => IconButton(
                            icon: wishList.exist(
                              Product(prodName, prodImage, oldPrice, price, 1),
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
                              wishList.add(
                                Product(
                                    prodName, prodImage, oldPrice, price, 1),
                              );
                            },
                          ),
                        )
                      ]),
                ),
                footer: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      prodName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Image.network(
                    prodImage,
                    // fit: BoxFit.cover,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
