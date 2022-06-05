import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class paymentOption extends StatefulWidget {
  const paymentOption({Key? key}) : super(key: key);

  @override
  State<paymentOption> createState() => _paymentOptionState();
}

class _paymentOptionState extends State<paymentOption> {
  void getPaymentGateways() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://newspeciesappendpoints.herokuapp.com/getways'));
    request.body = json.encode({});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  String? option;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Payment Option:"),
          ListTile(
            title: Text("Cash on delivery"),
            leading: Radio(
                value: "cod",
                groupValue: option,
                onChanged: (value) {
                  setState(() {
                    option = value.toString();
                  });
                }),
          ),
          ListTile(
            title: Text("Rave"),
            leading: Radio(
                value: "Rave",
                groupValue: option,
                onChanged: (value) {
                  setState(() {
                    option = value.toString();
                  });
                }),
          )
        ],
      ),
    );
  }
}
