import 'package:flutter/material.dart';
import 'package:thenewspecies/components/UserInfo.dart';
import 'package:thenewspecies/components/checkOutProduct.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  String names = "",
      neighborhood = "",
      neighborhoodDetails = "",
      phone = "",
      email = "";

  getData() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      names = prefs.getString("names").toString();
      neighborhood = prefs.getString("neighborhood").toString();
      neighborhoodDetails = prefs.getString("neighborhoodDetails").toString();
      email = prefs.getString("email").toString();
      phone = prefs.getString("phone").toString();
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
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: UserInfo(),
    );
  }
}
