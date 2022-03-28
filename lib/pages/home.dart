// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:newspecies/pages/search.dart';
import 'package:provider/provider.dart';
import 'package:newspecies/components/bottomNavigation.dart';
import 'package:newspecies/components/horizontal_listView.dart';
import 'package:newspecies/components/products.dart';
import 'package:newspecies/pages/cart.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:badges/badges.dart';
import 'package:newspecies/store/cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("object");
  }

  @override
  Widget build(BuildContext context) {
    Widget ImageCarousel = Container(
      height: 250.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/b1.jpeg'),
          AssetImage('images/b2.jpg'),
          // AssetImage('images/w1.jpeg'),
          // AssetImage('images/w2.jpeg'),
          // AssetImage('images/w3.jpeg'),
        ],
        autoplay: false,
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        // animationCurve: Curves.fastOutSlowIn,
        // animationDuration: Duration(milliseconds: 1000),
      ),
    );
    return Scaffold(
      backgroundColor: HexColor("#F2E5E5"),
      appBar: AppBar(
        iconTheme: IconThemeData(color: HexColor("#9D0208")),
        elevation: 0.1,
        backgroundColor: HexColor("#F2E5E5"),
        title: Container(
          height: 60.0,
          child: Stack(
            children: [
              Positioned(
                top: 10.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                            color: HexColor("#9D0208").withOpacity(0.5),
                            width: 1.0),
                        color: Colors.white),
                    child: Center(
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onFocusChange: (value) => Navigator.of(context)
                                  .push(MaterialPageRoute(
                                      builder: ((context) => Cart()))),
                              onTap: () {
                                print("taped");
                              },
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return SearchProduct();
                                    }));
                                  },
                                  child: Text(
                                    "Search",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  style: ButtonStyle(
                                    alignment: Alignment.centerLeft,
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0))),
                                  )
                                  // decoration: InputDecoration(
                                  //   hintText: "Search",
                                  //   border: OutlineInputBorder(
                                  //       borderRadius: BorderRadius.all(
                                  //           Radius.circular(50))),
                                  // ),
                                  ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: HexColor("#9D0208"),
                            ),
                            onPressed: () {
                              print("your menu action here");
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Consumer<CartStore>(
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
                        icon: const Icon(Icons.shopping_cart_rounded),
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
              ))
          // IconButton(
          //     icon: Icon(Icons.search, color: Colors.white), onPressed: null),
          // IconButton(
          //     icon: Icon(Icons.shopping_cart, color: Colors.white),
          //     onPressed: () {
          //       Navigator.of(context)
          //           .push(MaterialPageRoute(builder: (context) => Cart()));
          //     })

          // IconButton(onPressed: () {}, icon: Icon(Icons.account_box)),
        ],
      ),
      // drawer: Drawer(
      //   backgroundColor: HexColor("9D0208"),
      //   child: ListView(
      //     children: [
      //       //header
      //       UserAccountsDrawerHeader(
      //         accountName: Text('Alain Tresor'),
      //         accountEmail: Text('tresoralain35@gmail.com'),
      //         currentAccountPicture: GestureDetector(
      //           child: CircleAvatar(
      //             backgroundColor: Colors.grey,
      //             child: Icon(
      //               Icons.person,
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //         decoration: BoxDecoration(
      //           color: HexColor("9D0208"),
      //         ),
      //       ),
      //       //body
      //       InkWell(
      //         onTap: () {},
      //         child: ListTile(
      //           title: Text(
      //             'Home Page',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //           leading: Icon(Icons.home, color: Colors.white),
      //         ),
      //       ),

      //       InkWell(
      //         onTap: () {},
      //         child: ListTile(
      //           title: Text(
      //             'My account',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //           leading: Icon(Icons.person, color: Colors.white),
      //         ),
      //       ),

      //       InkWell(
      //         onTap: () {},
      //         child: ListTile(
      //           title: Text(
      //             'My orders',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //           leading: Icon(Icons.shopping_basket, color: Colors.white),
      //         ),
      //       ),

      //       InkWell(
      //         onTap: () {
      //           Navigator.of(context)
      //               .push(MaterialPageRoute(builder: (context) => Cart()));
      //         },
      //         child: ListTile(
      //           title: Text(
      //             'Shopping cart',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //           leading: Icon(Icons.shopping_cart, color: Colors.white),
      //         ),
      //       ),

      //       InkWell(
      //         onTap: () {},
      //         child: ListTile(
      //           title: Text(
      //             'Favourites',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //           leading: Icon(Icons.favorite, color: Colors.white),
      //         ),
      //       ),
      //       Divider(),

      //       InkWell(
      //         onTap: () {},
      //         child: ListTile(
      //           title: Text(
      //             'Settings',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //           leading: Icon(
      //             Icons.settings,
      //             color: Colors.blue,
      //           ),
      //         ),
      //       ),

      //       InkWell(
      //         onTap: () {},
      //         child: ListTile(
      //           title: Text(
      //             'About',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //           leading: Icon(
      //             Icons.help,
      //             color: Colors.green,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // body: Column(
      //   children: [
      //     //ImageCarousel begins here
      //     // ImageCarousel,

      //     //padding begins here
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Text(
      //         'Categories',
      //         style: TextStyle(
      //           fontSize: 16,
      //         ),
      //       ),
      //     ),
      //     HorizontalList(),

      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Text(
      //         'Recent Products',
      //         style: TextStyle(
      //           fontSize: 16,
      //         ),
      //       ),
      //     ),

      //     //Products
      //     Flexible(
      //       child: Products(),
      //     )
      //   ],
      // ),
      body: customBarWidget(),
      bottomNavigationBar: BottomNavigationBtn(),
    );
  }
}

class customBarWidget extends StatelessWidget {
  const customBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    Widget ImageCarousel = Container(
      height: screenHeight / 6,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/b1.PNG'),
          AssetImage('images/b2.PNG'),
        ],
        autoplay: true,
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        // animationCurve: Curves.fastOutSlowIn,
        // animationDuration: Duration(milliseconds: 1000),
      ),
    );
    return SafeArea(
      child: ListView(
        children: [
          //     //padding begins here
          ImageCarousel,
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Container(child: HorizontalList()),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 8),
                child: Text(
                  'Popular Products',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
        ],
          ),
          Container(
            child: Products(),
          )
        ],
      ),
    );
  }
}
