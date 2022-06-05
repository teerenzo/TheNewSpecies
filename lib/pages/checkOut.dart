import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newspecies/model/Order.dart';
import 'package:newspecies/model/product.dart';
import 'package:provider/provider.dart';
import 'package:newspecies/components/UserInfo.dart';
import 'package:newspecies/components/checkOutProduct.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newspecies/store/chechOut.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  List productList = [];
  String names = "",
      mappedString = "",
      neighborhood = "",
      neighborhoodDetails = "",
      phone = "",
      email = "";

  bool isLoading = true;
  bool isDone = true;

  getData() async {
    var prefs = await SharedPreferences.getInstance();

    setState(() {
      names = prefs.getString("names").toString();
      neighborhood = prefs.getString("neighborhood").toString();
      neighborhoodDetails = prefs.getString("neighborhoodDetails").toString();
      email = prefs.getString("email").toString();
      phone = prefs.getString("phone").toString();
      isLoading = false;
      // CheckOutStore checkOut = CheckOutStore();
      // checkOut.itemList.forEach((element) {
      //   LineItems lineItems = LineItems(element.id, element.quantity);

      //   productList.add(lineItems);
      // });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    names = "";
    neighborhood = "";
    neighborhoodDetails = "";
    phone = "";
    email = "";
    mappedString = "";
    productList = [];
    getData();
    // print(productList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: HexColor("F2E5E5"),
      appBar: AppBar(
        backgroundColor: HexColor("9D0208"),
        title: Text("CheckOut"),
      ),
      bottomNavigationBar: Consumer<CheckOutStore>(
        builder: (context, CheckOut, child) => CheckOut.count <= 0
            ? Container(
                child: Center(
                  child: Text("Cart is Empty"),
                ),
              )
            : isLoading
                ? Center(
                    child: SpinKitFadingCircle(
                      color: HexColor("#9D0208"),
                      size: 30.0,
                    ),
                  )
                : Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text('Total'),
                            subtitle: Text("${CheckOut.totalAmount} /Rwf"),
                          ),
                        ),
                        Expanded(
                          child: Consumer<CheckOutStore>(
                            builder: (context, checkOutProduct, child) =>
                                MaterialButton(
                              onPressed: () {
                                checkOutProduct.itemList.forEach(
                                  (element) {
                                    LineItems lineItem =
                                        LineItems(element.id, element.quantity);
                                    String data = jsonEncode(lineItem);

                                    setState(() {
                                      // print(data);
                                      mappedString = mappedString + data + ",";
                                      productList.add(data);
                                    });
                                  },
                                );
                                createOrder(productList);
                                // print(productList);
                              },
                              color: HexColor("9D0208"),
                              child: isDone
                                  ? Text(
                                      'Order',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  : Text(
                                      'Loading',
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
      ),
      body: UserInfo(),
    );
  }

  void createOrder(List productList1) async {
    print(mappedString);
    List test = [];
    // String encode = jsonEncode(test);
    // print(test);
    for (var i = 0; i < productList1.length; i++) {
      test.add(productList1[i]);
    }
    print("test:" + test.toString());
    // print(test);
    var test2 = {
      "payment_method": "bacs",
      "payment_method_title": "Direct Bank Transfer",
      "set_paid": true,
      "billing": {
        "first_name": names.split(' ')[0],
        "last_name": names.split(' ')[1],
        "address_1": neighborhoodDetails,
        "address_2": "",
        "city": "Kigali",
        "state": neighborhood,
        "postcode": "94103",
        "country": "RW",
        "email": email,
        "phone": phone
      },
      "shipping": {
        "first_name": names.split(' ')[0],
        "last_name": names.split(' ')[1],
        "address_1": neighborhoodDetails,
        "address_2": "",
        "city": "Kigali",
        "state": neighborhood,
        "postcode": "94103",
        "country": "Rw"
      },

      // "line_items": productList1,
      "line_items": "$test",
      "shipping_lines": [
        {
          "method_id": "flat_rate",
          "method_title": "Flat Rate",
          "total": "10.00"
        }
      ]
    };
    // productList1.forEach((element) {
    //   // print(JsonEncoder(element.toJson()));
    // });
    // print(productList1.);
    isDone = false;
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET',
        Uri.parse('https://newspeciesappendpoints.herokuapp.com/order'));
    request.body = json.encode(test2.toString());
    print(request.body);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      setState(() {
        isDone = true;
      });
    } else {
      print(response.reasonPhrase);
    }
  }
}
