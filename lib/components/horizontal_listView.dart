import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';

class HorizontalList extends StatefulWidget {
  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  List categories = [];

  late bool isLoading;

  fetchCategory() async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('GET', Uri.parse('https://gorest.co.in/public/v2/users'));
    request.body = json.encode({"per_page": 10});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonRes = convert.jsonDecode(await response.stream.bytesToString());
      print(await response.stream.bytesToString());
      setState(() {
        categories = jsonRes;
        isLoading = false;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    fetchCategory();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator(
            color: Colors.amber,
          )
        : Container(
            height: 50.0,
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: ((context, index) =>
                  Categories(categories[index]['name'], "")),
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
