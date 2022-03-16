import 'package:flutter/material.dart';
import 'package:newspecies/components/formButton.dart';
import 'package:newspecies/components/inputfield.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:newspecies/pages/checkOut.dart';

class UserAccount extends StatefulWidget {
  String path;
  UserAccount({required this.path});

  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  late String names, neighborhood, neighborhoodDetails, phone, email;
  bool isLoading = false;
  String? namesError,
      neighborhoodError,
      emailError,
      phoneError,
      neighborhoodDetailsError;
  @override
  void initState() {
    super.initState();
    names = "";
    neighborhood = "";
    neighborhoodDetails = "";
    phone = "";
    email = "";
    neighborhoodError = null;
    neighborhoodDetailsError = null;
    phoneError = null;
    emailError = null;
    namesError = null;
  }

  void resetErrorText() {
    setState(() {
      neighborhoodError = null;
      neighborhoodDetailsError = null;
      phoneError = null;
      emailError = null;
      namesError = null;
    });
  }

  bool validate() {
    resetErrorText();

    RegExp emailExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    bool isValid = true;
    if (email.isEmpty) {
      setState(() {
        emailError = "enter email please";
      });
      isValid = false;
    }

    if (names.isEmpty) {
      setState(() {
        namesError = "Please enter a names";
      });
      isValid = false;
    }

    if (phone.isEmpty) {
      setState(() {
        phoneError = "Please enter phone number";
      });
      isValid = false;
    }

    if (neighborhood.isEmpty) {
      setState(() {
        neighborhoodError = "this field is required";
      });
      isValid = false;
    }
    if (neighborhoodDetails.isEmpty) {
      setState(() {
        neighborhoodDetailsError = "this field is required";
      });
      isValid = false;
    }

    return isValid;
  }

  submit() async {
    if (validate()) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("names", names);
      prefs.setString("neighborhood", neighborhood);
      prefs.setString("neighborhoodDetails", neighborhoodDetails);
      prefs.setString("phone", phone);
      prefs.setString("email", email);
      if (widget.path == 'cart') {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CheckOut();
        }));
      } else {
        Navigator.of(context).pop();
      }
    }

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      throw UnimplementedError();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: HexColor("9D0208"),
        title: Text("Account"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 13, right: 13),
        child: ListView(
          children: [
            SizedBox(height: screenHeight * .025),
            const Text(
              "Billing Details",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            // SizedBox(height: screenHeight * .01),
            // Text(
            //   "Sign up to get started!",
            //   style: TextStyle(
            //     fontSize: 18,
            //     color: Colors.black.withOpacity(.6),
            //   ),
            // ),
            SizedBox(height: screenHeight * .050),
            InputField(
              onChanged: (value) {
                setState(() {
                  names = value;
                });
              },
              labelText: "full names",
              // errorText: emailError,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autoFocus: true,
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  neighborhood = value;
                });
              },
              labelText: "Kigali Neighborhood",
              errorText: neighborhoodError,
              // obscureText: true,
              textInputAction: TextInputAction.next,
            ),

            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  neighborhoodDetails = value;
                });
              },
              labelText: "neighborhood details",
              errorText: neighborhoodDetailsError,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autoFocus: true,
            ),

            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  phone = value;
                });
              },
              labelText: "phone ",
              errorText: phoneError,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autoFocus: true,
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              labelText: "email ",
              errorText: emailError,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autoFocus: true,
            ),

            SizedBox(height: screenHeight * .045),
            FormButton(
              text: "Save",
              onPressed: submit,
            ),
            SizedBox(height: screenHeight * .045),
          ],
        ),
      ),
    );
  }
}
