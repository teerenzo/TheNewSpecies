import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:thenewspecies/pages/cart.dart';

class BottomNavigationBtn extends StatefulWidget {
  const BottomNavigationBtn({Key? key}) : super(key: key);

  @override
  _BottomNavigationBtnState createState() => _BottomNavigationBtnState();
}

class _BottomNavigationBtnState extends State<BottomNavigationBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("9D0208"),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.comment,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Cart()));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
