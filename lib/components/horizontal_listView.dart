import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HorizontalList extends StatefulWidget {
  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  var categories = [];
  bool isLoading = true;

  fetchCategory() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://newspeciesendpointswoocomerce.herokuapp.com/categories'));
    request.body = '''{\n    "per_page":10\n}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonData = convert.jsonDecode(await response.stream.bytesToString());
      setState(() {
        categories = jsonData;
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
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            height: 50.0,
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Categories(categories[index]['name'], "");
              },
              scrollDirection: Axis.horizontal,
            ),
          );
  }
}

class Categories extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;
  Categories(this.imageCaption, this.imageLocation);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(13.0),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            // Image.asset(
            //   imageLocation,
            //   width: 80.0,
            //   height: 60.0,
            // ),
            Text(
              imageCaption,
              style: TextStyle(
                // fontWeight: FontWeight.w200,
                fontSize: 15.0,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
