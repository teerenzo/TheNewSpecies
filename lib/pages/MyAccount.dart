import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Account"),
        backgroundColor: HexColor("9D0208"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 13, right: 13, top: 13),
        child: Center(
          child: ListView(
            children: [
              ListTile(
                leading: CircleAvatar(child: Icon(Icons.account_box)),
                title: Text(
                  "Renzaho Emmanuel",
                  style: TextStyle(
                    fontSize: 21,
                  ),
                ),
                subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phone: 0780640237"),
                      Text("email: teerenzo.co@gmail.com")
                    ]),
                trailing: Icon(Icons.edit),
              ),
              Divider(
                thickness: 1,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * .020),
                    Text("Location:"),
                    SizedBox(height: screenHeight * .010),
                    ListTile(
                      leading: Icon(Icons.location_city),
                      title: Text("Gasabo/Gisozi"),
                      subtitle: Text("Near dove hotel"),
                      trailing: Icon(Icons.edit),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text("LogOut"),
                    )
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
