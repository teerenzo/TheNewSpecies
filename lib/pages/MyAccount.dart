import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:newspecies/pages/account.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  late String names, neighborhood, neighborhoodDetails, phone, email;

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
    super.initState();
    names = "";
    neighborhood = "";
    neighborhoodDetails = "";
    phone = "";
    email = "";
    getData();
  }

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
          // ignore: unrelated_type_equality_checks
          child: names.toString() == "null"
              ? TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return UserAccount(path: "account");
                    }));
                  },
                  child: Text("Save Your Information"))
              : ListView(
                  children: [
                    ListTile(
                      leading: CircleAvatar(child: Icon(Icons.account_box)),
                      title: Text(
                        "$names",
                        style: TextStyle(
                          fontSize: 21,
                        ),
                      ),
                      subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Phone: $phone"),
                            Text("email: $email")
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
                            title: Text("$neighborhood"),
                            subtitle: Text("$neighborhoodDetails"),
                            trailing: Icon(Icons.edit),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          InkWell(
                            onTap: (() => Logout()),
                            child: ListTile(
                              leading: Icon(Icons.logout),
                              title: Text("LogOut"),
                            ),
                          )
                        ])
                  ],
                ),
        ),
      ),
    );
  }

  Logout() async {
    var prefs = await SharedPreferences.getInstance();
    bool status = false;
    prefs.clear().then((value) =>
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return MyAccount();
        })));
  }
}
