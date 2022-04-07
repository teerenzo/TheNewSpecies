import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:newspecies/model/subcategory.dart';
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
  List<SubCategory> subcategory = <SubCategory>[];
  bool isLoading = false;
  getSubCategory() async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://newspeciesendpointswoocomerce.herokuapp.com/getSubCategories'));
    request.body = json.encode({"categoryId": widget.productByCategory.id});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonData = convert.jsonDecode(await response.stream.bytesToString());
      for (var item in jsonData) {
        SubCategory subCategory = SubCategory.fromJson(item);
        if (subCategory.name != null) {
          subcategory.add(subCategory);
        }
        // print(product.category);
      }
      // for (var i = 0; i < 5; i++) {
      //   SubCategory subCategory1 = SubCategory(name: "test");
      //   subcategory.add(subCategory1);
      // }

      setState(() {
        isLoading = true;
      });

      // print();
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSubCategory();
  }

  @override
  Widget build(BuildContext context) {
    SubCategory subCategory = new SubCategory(name: "");
    return isLoading
        ? subcategory.length <= 0
            ? Scaffold(
                appBar: AppBar(
                    backgroundColor: HexColor("#9D0208"),
                    title: Text(widget.productByCategory.name.toString())),
                // body: ProductCategory(
                //   categoryModel: widget.productByCategory,
                // )),
                body: subcategory.length <= 0
                    ? ProductCategory(
                        categoryModel: widget.productByCategory,
                        subCategoryModel: subCategory,
                        subcategoryIsEmpty: true,
                      )
                    : TabBarView(
                        children:
                            List<Widget>.generate(subcategory.length, (index) {
                        return ProductCategory(
                          categoryModel: widget.productByCategory,
                          subCategoryModel: subcategory[index],
                          subcategoryIsEmpty: false,
                        );
                      })),
              )
            : DefaultTabController(
                length: subcategory.length,
                child: Scaffold(
                  appBar: AppBar(
                      bottom: TabBar(
                          tabs: List<Widget>.generate(subcategory.length,
                              (index) {
                        return Tab(
                          text: subcategory[index].name,
                        );
                      })),
                      backgroundColor: HexColor("#9D0208"),
                      title: Text(widget.productByCategory.name.toString())),
                  // body: ProductCategory(
                  //   categoryModel: widget.productByCategory,
                  // )),
                  body: subcategory.length <= 0
                      ? ProductCategory(
                          categoryModel: widget.productByCategory,
                          subCategoryModel: subCategory,
                          subcategoryIsEmpty: true,
                        )
                      : TabBarView(
                          children: List<Widget>.generate(subcategory.length,
                              (index) {
                          return ProductCategory(
                            categoryModel: widget.productByCategory,
                            subCategoryModel: subcategory[index],
                            subcategoryIsEmpty: false,
                          );
                        })),
                ),
              )
        : Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

class ProductCategory extends StatefulWidget {
  CategoryModel categoryModel;
  SubCategory subCategoryModel;
  bool subcategoryIsEmpty;
  ProductCategory(
      {required this.categoryModel,
      required this.subCategoryModel,
      required this.subcategoryIsEmpty});

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  List<Product> products = <Product>[];
  bool isLoading = true;
  late Product product;
  late List<Product> product1;

  Future<List<Product>> fetchProducts() async {
    // ? widget.categoryModel.id
    print(widget.subcategoryIsEmpty);
    if (widget.subcategoryIsEmpty == true) {
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
        var jsonData =
            convert.jsonDecode(await response.stream.bytesToString());

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
    } else {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'GET',
          Uri.parse(
              'https://newspeciesendpointswoocomerce.herokuapp.com/productsBycategory'));
      request.body = convert.json
          .encode({"per_page": 100, "category": widget.subCategoryModel.id});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var jsonData =
            convert.jsonDecode(await response.stream.bytesToString());

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
