import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newspecies/components/products.dart';
import 'package:newspecies/model/product.dart';
import 'package:http/http.dart' as http;
import 'package:newspecies/store/cart.dart';
import 'dart:convert' as convert;

import 'package:provider/provider.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({Key? key}) : super(key: key);

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  List<Product> products = <Product>[];
  bool isLoading = true;
  late String keyword, keywordToSearch;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    keyword = "";
    keywordToSearch = "";
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Container(
            height: 60.0,
            child: Stack(
              children: [
                Positioned(
                  top: 10.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(
                              color: HexColor("#9D0208").withOpacity(0.5),
                              width: 1.0),
                          color: Colors.white),
                      child: Center(
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onChanged: ((value) {
                                  setState(() {
                                    keyword = value;
                                  });
                                }),
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.search,
                                color: HexColor("#9D0208"),
                              ),
                              onPressed: () {
                                setState(() {
                                  products.clear;
                                  isLoading = true;
                                  keywordToSearch = keyword;
                                  if (keywordToSearch.isNotEmpty) {
                                    fetchProducts(keywordToSearch);
                                  }
                                });
                                print(keywordToSearch);

                                print("your menu action here");
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: keywordToSearch.isEmpty
            ? Center(child: Text(""))
            : isLoading
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
                  ));
  }

  fetchProducts(String keyword) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://newspeciesendpointswoocomerce.herokuapp.com/search'));
    request.body = convert.json.encode({"search": keyword});
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
      return products;
      // print(jsonData);
    } else {
      print(response.reasonPhrase);
      return products;
    }
  }
}
