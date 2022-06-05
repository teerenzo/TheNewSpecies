import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:newspecies/components/products.dart';
import 'package:newspecies/model/product.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:newspecies/store/cart.dart';
import 'package:provider/provider.dart';

class ProductHomeCategory extends StatefulWidget {
  int categoryId;
  String name;
  ProductHomeCategory({required this.categoryId, required this.name});

  @override
  State<ProductHomeCategory> createState() => _ProductHomeCategoryState();
}

class _ProductHomeCategoryState extends State<ProductHomeCategory> {
  List<Product> products = <Product>[];
  bool isLoading = true;

  fetchProducts() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://newspeciesappendpoints.herokuapp.com/productsBycategory'));
    request.body =
        convert.json.encode({"per_page": 100, "category": widget.categoryId});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonData = convert.jsonDecode(await response.stream.bytesToString());

      for (var item in jsonData) {
        Product product = Product.fromJson(item);
        if (product.images!.length > 0) {
          products.add(product);
        }
        print(product.category);
      }
      //  Product product = Product();
      // print(products);
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

  @override
  void initState() {
    // TODO: implement initState
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                height: screenHeight,
                padding: EdgeInsets.only(left: 15, right: 15),
                child: StaggeredGridView.countBuilder(
                  shrinkWrap: true,
                  itemCount: products.length,
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
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
}
