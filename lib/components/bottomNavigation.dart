import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newspecies/pages/MyAccount.dart';
import 'package:newspecies/pages/cart.dart';
import 'package:newspecies/pages/home.dart';
import 'package:newspecies/pages/wishList.dart';
import 'package:newspecies/store/cart.dart';
import 'package:newspecies/store/wishList.dart';
import 'package:provider/provider.dart';

class BottomNavigationBtn extends StatefulWidget {
  const BottomNavigationBtn({Key? key}) : super(key: key);

  @override
  _BottomNavigationBtnState createState() => _BottomNavigationBtnState();
}

class _BottomNavigationBtnState extends State<BottomNavigationBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("#9D0208"),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
            },
          ),
          Consumer<WishListStore>(
            builder: (context, value, child) => Badge(
                position: BadgePosition.topEnd(top: 3, end: 3),
                animationDuration: Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeColor: Colors.white,
                toAnimate: true,
                badgeContent: Text(
                  value.count.toString(),
                  style: TextStyle(
                      fontSize: 8,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                child: IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return WishList();
                          },
                        ),
                      );
                    })),
            // child: IconButton(
            //   icon: Icon(
            //     Icons.favorite,
            //     color: Colors.white,
            //   ),
            //   onPressed: () {
            //     Navigator.of(context)
            //         .push(MaterialPageRoute(builder: (context) => WishList()));
            //   },
            // ),
          ),
          Consumer<CartStore>(
            builder: (context, value, child) => Badge(
                position: BadgePosition.topEnd(top: 3, end: 3),
                animationDuration: Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeColor: Colors.white,
                toAnimate: true,
                badgeContent: Text(
                  value.count.toString(),
                  style: TextStyle(
                      fontSize: 8,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                child: IconButton(
                    icon: const Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return Cart();
                          },
                        ),
                      );
                    })),
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return MyAccount();
              }));
            },
          )
        ],
      ),
    );
  }
}
