import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newspecies/components/UserInfo.dart';
import 'package:newspecies/components/checkOutProduct.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newspecies/store/chechOut.dart';

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
                            print("clicked");
                          },
                          color: HexColor("9D0208"),
                          child: Text(
                            'Order',
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
}
