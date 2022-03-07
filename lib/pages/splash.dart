import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:thenewspecies/pages/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _duration().then((value) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    });
    super.initState();
  }

  Future<bool> _duration() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: HexColor('#9D0208'),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/log1.jpg",
                  width: size.width / 4,
                ),
                // SizedBox(
                //   height: size.height / 20,
                // ),
                // Text(
                //   "Buy Online With The Best Platform",
                //   style: TextStyle(
                //     fontSize: size.width / 19,
                //     color: HexColor("#F2E5E5"),
                //   ),
                // )
              ],
            ),
          ),
        ));
  }
}
