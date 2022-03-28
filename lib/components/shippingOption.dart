import 'package:flutter/material.dart';

class ShippingInfo extends StatefulWidget {
  const ShippingInfo({Key? key}) : super(key: key);

  @override
  State<ShippingInfo> createState() => _ShippingInfoState();
}

class _ShippingInfoState extends State<ShippingInfo> {
  String? option;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Shipping Option:"),
          ListTile(
            title: Text("Delivery Fees: 1,000.00 Rwf"),
            leading: Radio(
                value: "Delivery Fees: 1,000.00 Rwf",
                groupValue: option,
                onChanged: (value) {
                  setState(() {
                    option = value.toString();
                  });
                }),
          ),
          ListTile(
            title: Text("In Store Pickup"),
            leading: Radio(
                value: "In Store Pickup",
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
