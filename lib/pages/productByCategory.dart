import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:newspecies/components/products.dart';
import 'package:newspecies/model/category.dart';
import 'dart:convert' as convert;

import 'package:newspecies/model/product.dart';
import 'package:newspecies/store/cart.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductByCategpory extends StatefulWidget {
  CategoryModel productByCategory;
  ProductByCategpory({required this.productByCategory});

  @override
  State<ProductByCategpory> createState() => _ProductByCategporyState();
}

class _ProductByCategporyState extends State<ProductByCategpory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: HexColor("#9D0208"),
            title: Text(widget.productByCategory.name.toString())),
        body: ProductCategory(
          categoryModel: widget.productByCategory,
        ));
  }
}

class ProductCategory extends StatefulWidget {
  CategoryModel categoryModel;
  ProductCategory({required this.categoryModel});

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  List<Product> products = <Product>[];
  bool isLoading = true;
  late Product product;
  late List<Product> product1;
//   List<ac.Anime> animeList = new List<ac.Anime>();
// for(var item in jsonData){
//     ac.Anime anime = ac.Anime.fromJson(item);
//     animeList.add(item);
// }

  Future<List<Product>> fetchProducts() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://newspeciesendpointswoocomerce.herokuapp.com/productsBycategory'));
    request.body = convert.json
        .encode({"per_page": 100, "category": widget.categoryModel.id});
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
    //
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
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
          );
  }
}
