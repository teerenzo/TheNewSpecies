import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:hexcolor/hexcolor.dart';
import 'package:newspecies/model/category.dart';
import 'package:newspecies/pages/productByCategory.dart';

class HorizontalList extends StatefulWidget {
  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  // var categories = [];
  bool isLoading = true;
  List<CategoryModel> categories = <CategoryModel>[];

  fetchCategory() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://newspeciesappendpoints.herokuapp.com/categories'));
    request.body = '''{\n    "per_page":20\n}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonData = convert.jsonDecode(await response.stream.bytesToString());
      for (var item in jsonData) {
        CategoryModel categoryModel = CategoryModel.fromJson(item);
        if (categoryModel.image?.src != null) {
          categories.add(categoryModel);
        }
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
    print(categories);
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
            padding: EdgeInsets.only(
              top: 10,
            ),
            height: screenHeight / 7,
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Categories(categories[index]);
              },
              scrollDirection: Axis.vertical,
            ),
          );
  }
}

class Categories extends StatelessWidget {
  CategoryModel categoryProd;

  Categories(this.categoryProd);
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
        child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ProductByCategpory(productByCategory: categoryProd);
        }));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 3.4,
        child: InkWell(
          borderRadius: BorderRadius.circular(80.0),
          child: Column(
            children: [
              ListTile(
                // title: ClipRRect(
                //   borderRadius: BorderRadius.circular(50.0),
                //   child: Image.network(
                //     "${categoryProd.image?.src}",
                //     width: 50.0,
                //     height: 50.0,
                //     // fit: BoxFit.cover,
                //   ),
                // ),
                title: Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "${categoryProd.name}",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                // subtitle: Container(
                //   alignment: Alignment.topCenter,
                //   child: Text(
                //     "${categoryProd.name}",
                //     style: TextStyle(fontSize: 12.0),
                //   ),
                // )
              ),
              Divider()
            ],
          ),
        ),
      ),
    ));
  }
}
