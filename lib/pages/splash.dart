import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newspecies/pages/home.dart';
import 'package:newspecies/pages/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  static const spinkit = SpinKitWave(color: Color.fromARGB(255, 173, 17, 6));
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
        backgroundColor: HexColor("#F2E5E5"),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/logd.png",
                  width: size.width / 4,
                ),
                SizedBox(
                  height: size.height / 20,
                ),
                spinkit,
                // Text(
                //   "Buy Online With The Best Platform",
                //   style: TextStyle(
                //     fontSize: size.width / 19,
                //     color: HexColor("#F2E5E5"),
                //   ),
                //  )
              ],
            ),
          ),
        ));
  }
}
