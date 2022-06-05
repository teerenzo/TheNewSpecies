// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:newspecies/components/productCategory.dart';
import 'package:newspecies/model/product.dart';
import 'package:newspecies/pages/categories.dart';
import 'package:newspecies/pages/productHomeCategory.dart';
import 'package:newspecies/pages/product_details.dart';
import 'package:newspecies/pages/search.dart';
import 'package:newspecies/store/wishList.dart';
import 'package:provider/provider.dart';
import 'package:newspecies/components/bottomNavigation.dart';
import 'package:newspecies/components/horizontal_listView.dart';
import 'package:newspecies/components/products.dart';
import 'package:newspecies/pages/cart.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:badges/badges.dart';
import 'package:newspecies/store/cart.dart';
import 'dart:convert' as convert;

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

    // print("object");
  }

  @override
  Widget build(BuildContext context) {
    Widget ImageCarousel = Container(
      height: 400,
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
                            color: HexColor("#9D0208").withOpacity(0),
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

class customBarWidget extends StatefulWidget {
  const customBarWidget({Key? key}) : super(key: key);

  @override
  State<customBarWidget> createState() => _customBarWidgetState();
}

class _customBarWidgetState extends State<customBarWidget> {
  @override
  void initState() {
    // TODO: implement initState
    for (var item in testData) {
      Product productM = Product.fromJson(item);
      productList.add(productM);
    }
    super.initState();
  }

  var testData = [
    {
      "id": 2341,
      "name": "Tripod Stand",
      "price": "40000",
      "images": [
        {
          "id": 2342,
          "date_created": "2022-04-02T18:05:08",
          "date_created_gmt": "2022-04-02T18:05:08",
          "date_modified": "2022-04-02T18:05:08",
          "date_modified_gmt": "2022-04-02T18:05:08",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2022/04/25641146_0b791d3d475c62dce3e92ace1d8f4963_680x680.jpg",
          "name": "25641146_0b791d3d475c62dce3e92ace1d8f4963_680x680",
          "alt": ""
        },
        {
          "id": 2343,
          "date_created": "2022-04-02T18:07:16",
          "date_created_gmt": "2022-04-02T18:07:16",
          "date_modified": "2022-04-02T18:07:16",
          "date_modified_gmt": "2022-04-02T18:07:16",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2022/04/3113-1.jpg",
          "name": "3113-1",
          "alt": ""
        }
      ],
      "description":
          "&nbsp;3-WAY PAN HEAD &#8211; Endurax camera tripod features 360-degree swivel function, it allows for tilt and swivel motion; portrait or landscape options.QUICK-RELEASE PLATE &#8211; Helps install and remove camera in seconds. It makes fast transitions between shots and quickly moving from spot to spot possible. Built-in bubble level contributes to exact horizontal alignment.VERSATILE TRIPOD FOR CAMERA PHONE TABLET &#8211; Standard 1/4&#8243; screw fits most cameras, compatible with Canon rebel eos t6 t7 m50, Nikon d3500&#8230;Comes with an universal holder and remote shutter, you can shoot anytime, anywhere.(note: shutter works for phones and tablets, isn&#8217;t compatible for cameras)LIGHTWEIGHT, STURDY &#8211; Weighs 1.4 lbs; Extends from 17.5 to 60 inches. Endurax travel tripod is made of lightweight and durable aluminum, easy to travel with carry bag.WHAT YOU GET &#8211; 1x Tripod, 1x Phone/ Tablet Holder, 1x Remote Shutter, 1x Carry Bag. If you are looking for a camera stand with both price and performance, Endurax will be your overwhelming choice.",
      "category": [
        {"id": 22, "name": "Cameras", "slug": "cameras"},
        {"id": 59, "name": "Electronics", "slug": "electronics"},
        {"id": 35, "name": "New Arrival", "slug": "new-arrival"},
        {"id": 36, "name": "On Sale", "slug": "on-sale"}
      ],
      "quantity": 1
    },
    {
      "id": 2337,
      "name": "YESPLUS YS-503",
      "price": "80000",
      "images": [
        {
          "id": 2338,
          "date_created": "2022-03-31T08:19:24",
          "date_created_gmt": "2022-03-31T08:19:24",
          "date_modified": "2022-03-31T08:19:24",
          "date_modified_gmt": "2022-03-31T08:19:24",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2022/03/1_469.jpg",
          "name": "1_469",
          "alt": ""
        },
        {
          "id": 2339,
          "date_created": "2022-03-31T08:19:49",
          "date_created_gmt": "2022-03-31T08:19:49",
          "date_modified": "2022-03-31T08:19:49",
          "date_modified_gmt": "2022-03-31T08:19:49",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2022/03/YesPlus503Black2.jpg",
          "name": "YesPlus503Black2",
          "alt": ""
        }
      ],
      "description":
          "A brand-new, unused, unopened, undamaged item in its original packaging (where packaging is applicable). Packaging should be the same as what is found in a retail store, unless the item is handmade or was packaged by the manufacturer in non-retail packaging, such as an unprinted box or plastic bag.Bluetooth Microphone Type: Built-InConnectivity:3.5mm Jack, BluetoothType: Ear-Pad (On the Ear)Features: Bluetooth v5.0 + EDR, Adjustable Headband, Built-in Microphone, Built-In On/Off Switch, Call functions, Detachable Cable, Extra Bass, FoldableMPN: Does Not ApplyBrand: YESPLUS",
      "category": [
        {"id": 19, "name": "Audio", "slug": "audio"},
        {"id": 27, "name": "Headphones", "slug": "headphones"},
        {"id": 33, "name": "Most Popular", "slug": "most-popular"},
        {"id": 35, "name": "New Arrival", "slug": "new-arrival"},
        {"id": 36, "name": "On Sale", "slug": "on-sale"}
      ],
      "quantity": 1
    },
    {
      "id": 2330,
      "name": "HUB Adapter 6in1 USB-C to TF/SD+USB3.0/2.0+PD",
      "price": "60000",
      "images": [
        {
          "id": 2332,
          "date_created": "2022-03-30T14:09:46",
          "date_created_gmt": "2022-03-30T14:09:46",
          "date_modified": "2022-03-30T14:09:46",
          "date_modified_gmt": "2022-03-30T14:09:46",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2022/03/item_3755018_600.jpg",
          "name": "item_3755018_600",
          "alt": ""
        }
      ],
      "description":
          "Rule All in one USB C Hub: The intelligent USB C Adapter has perfectly combined all the functions you need. USB C to HDMI hub equipped with USB3.0 x2, 4K@30 HDMI, SD/TF Card Adapter, and Up to 100W/20V/5A Type C Power Delivery charging port.4K HDMI to USB C Hub: The USB C Hub provides you with lifelike 4K 3840 x 2160@30Hz HDMI images that bring an immersive 3D resolution experience.100W Power Delivery Supported: The USB C Hub supports a 100W USB C pass-through charging, ideal for MacBook Pro/Air or and other USB c devices, your primary choice of USB C Hub.Efficient USB C Hub: Two high-speed USB-A 3.0 ports capable of 5Gb/s transfer speed for quick data transfer &amp; Charging up to 5V@0.9A. Plug and Play, No Software, Drivers required.Travel Size SD/TF USB C Adapter: Aluminium Alloy Casting and 2.4ounce Pocket Size,5Gbps read and write, capacity up to 2TB cards.Ideal as a Mac Book Pro USB C Hub/USB C Laptop Hub for traveling.",
      "category": [
        {"id": 316, "name": "Computer", "slug": "computer"},
        {"id": 59, "name": "Electronics", "slug": "electronics"},
        {"id": 170, "name": "Gadgets", "slug": "gadgets"},
        {"id": 33, "name": "Most Popular", "slug": "most-popular"},
        {"id": 35, "name": "New Arrival", "slug": "new-arrival"},
        {"id": 36, "name": "On Sale", "slug": "on-sale"}
      ],
      "quantity": 1
    },
    {
      "id": 2321,
      "name": "high quality leather case: x,xr,xs max,11,11promax,12,12promax",
      "price": "15000",
      "images": [
        {
          "id": 2323,
          "date_created": "2022-03-29T08:57:07",
          "date_created_gmt": "2022-03-29T08:57:07",
          "date_modified": "2022-03-29T08:57:07",
          "date_modified_gmt": "2022-03-29T08:57:07",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2022/03/Forcell-LEATHER-Case-for-IPHONE-11-61-black-2.jpg",
          "name": "Forcell-LEATHER-Case-for-IPHONE-11-61-black-2",
          "alt": ""
        },
        {
          "id": 2324,
          "date_created": "2022-03-29T08:57:50",
          "date_created_gmt": "2022-03-29T08:57:50",
          "date_modified": "2022-03-29T08:57:50",
          "date_modified_gmt": "2022-03-29T08:57:50",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2022/03/35BD42FD-1831-4020-98C6-AB3B4E823DFD.jpeg",
          "name": "35BD42FD-1831-4020-98C6-AB3B4E823DFD",
          "alt": ""
        },
        {
          "id": 2325,
          "date_created": "2022-03-29T08:58:05",
          "date_created_gmt": "2022-03-29T08:58:05",
          "date_modified": "2022-03-29T08:58:05",
          "date_modified_gmt": "2022-03-29T08:58:05",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2022/03/iPhone-13-Pro-Max-Case-01.jpg",
          "name": "iPhone-13-Pro-Max-Case-01",
          "alt": ""
        },
        {
          "id": 2326,
          "date_created": "2022-03-29T08:58:13",
          "date_created_gmt": "2022-03-29T08:58:13",
          "date_modified": "2022-03-29T08:58:13",
          "date_modified_gmt": "2022-03-29T08:58:13",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2022/03/iPhone-13-Pro-Max-Case-02.jpg",
          "name": "iPhone-13-Pro-Max-Case-02",
          "alt": ""
        },
        {
          "id": 2327,
          "date_created": "2022-03-29T08:58:24",
          "date_created_gmt": "2022-03-29T08:58:24",
          "date_modified": "2022-03-29T08:58:24",
          "date_modified_gmt": "2022-03-29T08:58:24",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2022/03/iPhone-13-Pro-Max-Case-04.jpg",
          "name": "iPhone-13-Pro-Max-Case-04",
          "alt": ""
        },
        {
          "id": 2328,
          "date_created": "2022-03-29T08:58:28",
          "date_created_gmt": "2022-03-29T08:58:28",
          "date_modified": "2022-03-29T08:58:28",
          "date_modified_gmt": "2022-03-29T08:58:28",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2022/03/pokrowiec-forcell-leather-case-zolty-samsung-a52-5g-pid16171-3.jpg",
          "name":
              "pokrowiec-forcell-leather-case-zolty-samsung-a52-5g-pid16171-3",
          "alt": ""
        }
      ],
      "description":
          "Colors: Black / white / Red / Pink/GreenMade of soft TPU, electroplated PC and PU, and finished with Nano-oil layer, it&#8217;s very to comfortable to use it everyday.Protects the camera, back and all edges of your mobile phone from being scratched by daily frictions.Features the gold electroplated line on the back and around the camera, it looks luxury and could be a very nice decoration to your mobile phone.",
      "category": [
        {"id": 17, "name": "Accessories", "slug": "accessories"},
        {"id": 103, "name": "cover", "slug": "cover"},
        {"id": 33, "name": "Most Popular", "slug": "most-popular"},
        {"id": 35, "name": "New Arrival", "slug": "new-arrival"},
        {"id": 36, "name": "On Sale", "slug": "on-sale"}
      ],
      "quantity": 1
    },
    {
      "id": 2317,
      "name": "PlayStation 3 Dualshock 3 Wireless Controller (Black)",
      "price": "35000",
      "images": [
        {
          "id": 2335,
          "date_created": "2022-03-30T18:03:10",
          "date_created_gmt": "2022-03-30T18:03:10",
          "date_modified": "2022-03-30T18:03:10",
          "date_modified_gmt": "2022-03-30T18:03:10",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2022/03/61nyaUEzFlL._SX522_.jpg",
          "name": "61nyaUEzFlL._SX522_",
          "alt": ""
        },
        {
          "id": 2318,
          "date_created": "2022-03-29T08:40:09",
          "date_created_gmt": "2022-03-29T08:40:09",
          "date_modified": "2022-03-29T08:40:09",
          "date_modified_gmt": "2022-03-29T08:40:09",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2022/03/51KtQM1CYDL._AC_SY679_.jpg",
          "name": "51KtQM1CYDL._AC_SY679_",
          "alt": ""
        },
        {
          "id": 2319,
          "date_created": "2022-03-29T08:40:55",
          "date_created_gmt": "2022-03-29T08:40:55",
          "date_modified": "2022-03-29T08:40:55",
          "date_modified_gmt": "2022-03-29T08:40:55",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2022/03/5be2cb072906513117a0d7c5ab54ad6c.jpg",
          "name": "5be2cb072906513117a0d7c5ab54ad6c",
          "alt": ""
        }
      ],
      "description":
          "The only Bluetooth controller for the PS3 system;Hours of comfortable game play with ergonomically designed grips;Feel every hit, crash, and explosion with hand-vibrating DUALSHOCK responseTruly intuitive game play through the motion sensing SIXAXIS technology;Play wirelessly with up to seven friends;",
      "category": [
        {"id": 22, "name": "Cameras", "slug": "cameras"},
        {"id": 58, "name": "Games &amp; Consoles", "slug": "electronic"}
      ],
      "quantity": 1
    },
    {
      "id": 2313,
      "name": "MagSafe Battery Pack",
      "price": "70000",
      "images": [
        {
          "id": 2315,
          "date_created": "2022-03-23T16:00:39",
          "date_created_gmt": "2022-03-23T16:00:39",
          "date_modified": "2022-03-23T16:00:39",
          "date_modified_gmt": "2022-03-23T16:00:39",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2022/03/MJWY3_AV4.jpg",
          "name": "MJWY3_AV4",
          "alt": ""
        },
        {
          "id": 2314,
          "date_created": "2022-03-23T15:59:43",
          "date_created_gmt": "2022-03-23T15:59:43",
          "date_modified": "2022-03-23T15:59:43",
          "date_modified_gmt": "2022-03-23T15:59:43",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2022/03/apple-battery-6-1626343316.jpg",
          "name": "apple-battery-6-1626343316",
          "alt": ""
        }
      ],
      "description":
          "Attaching the MagSafe Battery Pack is a snap. Its compact, intuitive design makes on-the-go charging easy. The perfectly aligned magnets keep it attached to your iPhone 12, iPhone 12 Pro and iPhone 12 pro max or iPhone 13 , iPhone 13 Pro and iPhone 13 pro max — providing safe and reliable wireless charging. And it automatically charges, so there’s no need to turn it on or off.",
      "category": [
        {"id": 17, "name": "Accessories", "slug": "accessories"},
        {"id": 143, "name": "charger", "slug": "charger"}
      ],
      "quantity": 1
    },
    {
      "id": 2280,
      "name": "Apple Clear Case with MagSafe",
      "price": "40000",
      "images": [
        {
          "id": 2312,
          "date_created": "2022-03-23T15:35:17",
          "date_created_gmt": "2022-03-23T15:35:17",
          "date_modified": "2022-03-23T15:35:17",
          "date_modified_gmt": "2022-03-23T15:35:17",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2022/03/MM2Y3_AV3.jpg",
          "name": "MM2Y3_AV3",
          "alt": ""
        },
        {
          "id": 2311,
          "date_created": "2022-03-23T15:35:05",
          "date_created_gmt": "2022-03-23T15:35:05",
          "date_modified": "2022-03-23T15:35:05",
          "date_modified_gmt": "2022-03-23T15:35:05",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2022/03/MM2Y3.jpg",
          "name": "MM2Y3",
          "alt": ""
        }
      ],
      "description":
          "Thin, light, and easy to grip — this Apple-designed case shows off the brilliant colored finish of iPhone,12,12 pro,12 pro max, 13 ,13 pro,13 pro max, while providing extra protection. this case offers a magical attach experience and faster wireless charging, every time. When it’s time to charge",
      "category": [
        {"id": 17, "name": "Accessories", "slug": "accessories"},
        {"id": 103, "name": "cover", "slug": "cover"},
        {"id": 33, "name": "Most Popular", "slug": "most-popular"},
        {"id": 35, "name": "New Arrival", "slug": "new-arrival"},
        {"id": 36, "name": "On Sale", "slug": "on-sale"}
      ],
      "quantity": 1
    },
    {
      "id": 997,
      "name": "Apple Watch series 4",
      "price": "370000",
      "images": [
        {
          "id": 2273,
          "date_created": "2022-03-07T06:43:19",
          "date_created_gmt": "2022-03-07T06:43:19",
          "date_modified": "2022-03-07T06:43:19",
          "date_modified_gmt": "2022-03-07T06:43:19",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2022/03/71rhrO49SmL._SX522_.jpg",
          "name": "71rhrO49SmL._SX522_",
          "alt": ""
        }
      ],
      "description":
          "Renewed products look and work like new. These pre-owned products have been inspected and tested by Amazon-qualified suppliers, which typically perform a full diagnostic test, replacement of any defective parts, and a thorough cleaning process. Wireless devices have batteries tested to have at least 80% capacity relative to new at the time of sale. Packaging, wall plug, Watch Strap, and charging cable may be generic (headphones not included). Wireless products on Amazon Renewed come with the 90GPS + Cellular. S4 SiP with faster 64-bit dual-core processorOver 30% larger display and 50% louder speaker , 50% louder speakerDigital Crown with haptic feedback. Electrical and optical heart sensors.Improved accelerometer and gyroscope for fall detection. Swimproof. watchOS 5",
      "category": [
        {"id": 33, "name": "Most Popular", "slug": "most-popular"},
        {"id": 35, "name": "New Arrival", "slug": "new-arrival"},
        {"id": 36, "name": "On Sale", "slug": "on-sale"},
        {"id": 48, "name": "Smart Watch", "slug": "smart-watch"},
        {"id": 45, "name": "Watches", "slug": "watches"}
      ],
      "quantity": 1
    },
    {
      "id": 2260,
      "name": "iPhone 13 pro",
      "price": "1400000",
      "images": [
        {
          "id": 2264,
          "date_created": "2022-03-05T17:27:17",
          "date_created_gmt": "2022-03-05T17:27:17",
          "date_modified": "2022-03-05T17:27:17",
          "date_modified_gmt": "2022-03-05T17:27:17",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2022/03/iphone-13-pro-graphite-select.jpg",
          "name": "iphone-13-pro-graphite-select",
          "alt": ""
        }
      ],
      "description":
          "Superfast downloads, high‑quality streamingCinematic mode in 1080p at 30 fpsDolby Vision HDR video recording up to 4K at 60 fpsOptical zoom rangeLiDAR Scanner for Night mode portraits, faster autofocus in low light, and next-level AR experiencesA15 Bionic chipUp to 22 hours video playback batteryWater resistant to a depth of 6 meters for up to 30 minutesNight mode portraitsPhotographic Styles",
      "category": [
        {"id": 33, "name": "Most Popular", "slug": "most-popular"},
        {"id": 35, "name": "New Arrival", "slug": "new-arrival"},
        {"id": 36, "name": "On Sale", "slug": "on-sale"},
        {"id": 48, "name": "Smart Watch", "slug": "smart-watch"},
        {"id": 39, "name": "Smartphone", "slug": "smartphone"},
        {
          "id": 69,
          "name": "smartphone",
          "slug": "smartphone-smartphone-electronics"
        }
      ],
      "quantity": 1
    },
    {
      "id": 2255,
      "name": "Apple Watch series 7",
      "price": "600000",
      "images": [
        {
          "id": 2257,
          "date_created": "2022-03-04T16:38:55",
          "date_created_gmt": "2022-03-04T16:38:55",
          "date_modified": "2022-03-04T16:38:55",
          "date_modified_gmt": "2022-03-04T16:38:55",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2022/03/MKUQ3_VW_PFwatch-45-alum-midnight-nc-7s_VW_PF_WF_CO.jpg",
          "name": "MKUQ3_VW_PF+watch-45-alum-midnight-nc-7s_VW_PF_WF_CO",
          "alt": ""
        },
        {
          "id": 2259,
          "date_created": "2022-03-04T16:39:30",
          "date_created_gmt": "2022-03-04T16:39:30",
          "date_modified": "2022-03-04T16:39:30",
          "date_modified_gmt": "2022-03-04T16:39:30",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2022/03/hero_colors_green__beokeads7ng2_large.jpg",
          "name": "hero_colors_green__beokeads7ng2_large",
          "alt": ""
        },
        {
          "id": 2258,
          "date_created": "2022-03-04T16:39:16",
          "date_created_gmt": "2022-03-04T16:39:16",
          "date_modified": "2022-03-04T16:39:16",
          "date_modified_gmt": "2022-03-04T16:39:16",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2022/03/Apple_watch-series7-availability_durability_10052021_big.jpg.slideshow-large_2x.jpg",
          "name":
              "Apple_watch-series7-availability_durability_10052021_big.jpg.slideshow-large_2x",
          "alt": ""
        }
      ],
      "description": "",
      "category": [
        {"id": 33, "name": "Most Popular", "slug": "most-popular"},
        {"id": 35, "name": "New Arrival", "slug": "new-arrival"},
        {"id": 36, "name": "On Sale", "slug": "on-sale"},
        {"id": 48, "name": "Smart Watch", "slug": "smart-watch"},
        {"id": 45, "name": "Watches", "slug": "watches"}
      ],
      "quantity": 1
    }
  ];
  List<Product> productList = <Product>[];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    Widget ImageCarousel = Container(
      height: screenHeight / 4,
      child: Carousel(
        // boxFit: BoxFit.cover,
        images: [
          // Image.asset("images/b1.PNG"),
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
    Widget ImageCarouselPro = Container(
      height: screenHeight / 6,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "images/b1.PNG",
                // height: 20,
              )),
          ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset("images/b2.PNG")),
          ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset("images/b1.PNG")),
          // AssetImage('images/b1.PNG'),
          // Image.asset('images/b2.PNG'),
        ],
        autoplay: false,
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
          // GridView.builder(
          //   itemCount: 2,
          //   itemBuilder: (context, index) {
          //     return Text("hey man");
          //   },
          //   gridDelegate:
          //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          // ),
          SizedBox(height: screenHeight * .007),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   // crossAxisAlignment: CrossAxisAlignment.stretch,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(top: 8, left: 8),
          //       child: Text(
          //         'Categories',
          //         style: TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //     TextButton(onPressed: () {}, child: Text("View more"))
          //   ],
          // ),
          // SizedBox(height: screenHeight * .007),
          Container(
            height: screenHeight / 6,
            padding: EdgeInsets.all(8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: ((context) {
                          return CategoriesPage();
                        })));
                      },
                      icon: Icon(Icons.category),
                      iconSize: 40,
                    ),
                    Text("All category")
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .050,
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.account_balance_wallet_rounded),
                      iconSize: 40,
                    ),
                    Text("Top Sales")
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .050,
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.work),
                      iconSize: 40,
                    ),
                    Text("Repairing \n Service")
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .050,
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.chat,
                        // color: Colors.green,
                      ),
                      iconSize: 40,
                    ),
                    Text("Chat with us")
                  ],
                ),
              ],
            ),
          ),
          // Container(color: Colors.white, child: HorizontalList()),
          SizedBox(height: screenHeight * .007),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8),
                child: Text(
                  'Hot Product by Category',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // TextButton(onPressed: () {}, child: Text("View more"))
            ],
          ),
          SizedBox(height: screenHeight * .007),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
                  // height: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor("#FABEC0")),
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.all(12),
                            child: Text("Electronics")),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: (() {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return ProductHomeCategory(
                                      categoryId: 39,
                                      name: "SmartPhones",
                                    );
                                  }));
                                }),
                                child: Image.asset(
                                  "images/cats/phone.jpeg",
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: (() {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return ProductHomeCategory(
                                      categoryId: 44,
                                      name: "Games & Consoles",
                                    );
                                  }));
                                }),
                                child: Image.asset(
                                  "images/cats/game.jpg",
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return ProductHomeCategory(
                                      categoryId: 316,
                                      name: "Computer",
                                    );
                                  }));
                                },
                                child: Image.asset(
                                  "images/cats/comp.jpg",
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
                  // height: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor("#F37970")),
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.all(12),
                            child: Text("Accessories")),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: (() {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return ProductHomeCategory(
                                      categoryId: 59,
                                      name: "Cover",
                                    );
                                  }));
                                }),
                                child: Image.asset(
                                  "images/cats/cover.jpg",
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return ProductHomeCategory(
                                      categoryId: 60,
                                      name: "Screen Protector",
                                    );
                                  }));
                                },
                                child: Image.asset(
                                  "images/cats/screen protector.jpg",
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return ProductHomeCategory(
                                      categoryId: 61,
                                      name: "Charges",
                                    );
                                  }));
                                },
                                child: Image.asset(
                                  "images/cats/charger.jpg",
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
                  // height: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor("#F85C70")),
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.all(12), child: Text("Audio")),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: (() {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return ProductHomeCategory(
                                      categoryId: 231,
                                      name: "earphone",
                                    );
                                  }));
                                }),
                                child: Image.asset(
                                  "images/cats/earphone.jpg",
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: (() {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return ProductHomeCategory(
                                      categoryId: 27,
                                      name: "Headphones",
                                    );
                                  }));
                                }),
                                child: Image.asset(
                                  "images/cats/headset.jpg",
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: (() {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return ProductHomeCategory(
                                      categoryId: 41,
                                      name: "Speaker",
                                    );
                                  }));
                                }),
                                child: Image.asset(
                                  "images/cats/speaker.jpg",
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
            ],
          ),
          // Container(
          //     color: Colors.white,
          //     padding: EdgeInsets.only(left: 8, right: 8),
          //     height: screenHeight / 4,
          //     child: ImageCarouselPro),
          SizedBox(height: screenHeight * .007),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 8),
                child: Text(
                  'Popular Product',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ProductHomeCategory(
                        categoryId: 33,
                        name: "Most Popular Product",
                      );
                    }));
                  },
                  child: Text("View more"))
            ],
          ),
          Container(
            child: CategoryProduct(categoryId: 33),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 8),
                child: Text(
                  'Hot sales watches',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ProductHomeCategory(
                        categoryId: 45,
                        name: "Watches",
                      );
                    }));
                  },
                  child: Text("View more"))
            ],
          ),
          Container(
            child: CategoryProduct(categoryId: 45),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 8),
                child: Text(
                  'You may also like',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(onPressed: () {}, child: Text("View more"))
            ],
          ),
          Container(
            child: Products(),
          ),
        ],
      ),
    );
  }
}

class ProductBack extends StatefulWidget {
  Product product;
  ProductBack({required this.product});

  @override
  State<ProductBack> createState() => _ProductBackState();
}

class _ProductBackState extends State<ProductBack> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    String proname = widget.product.name.toString();
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.bottomRight,
      height: 50,
      color: Colors.white,
      width: MediaQuery.of(context).size.width / 2,
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            //here we are passing the data of product
            builder: (context) => ProductDetails(
                  product: widget.product,
                ))),
        child: Column(
          children: [
            Row(
              children: [
                // Consumer<WishListStore>(
                //   builder: (context, wishList, child) => IconButton(
                //     icon: wishList.exist(
                //       widget.product,
                //     )
                //         ? Icon(
                //             Icons.favorite,
                //             color: HexColor("9D0208"),
                //             size: 20,
                //           )
                //         : Icon(
                //             Icons.favorite_border,
                //             color: HexColor("9D0208"),
                //             size: 20,
                //           ),
                //     onPressed: () {
                //       showDialog(
                //         context: context,
                //         builder: (context) {
                //           return AlertDialog(
                //             // title: Text('Quantity'),
                //             content: Text('Product added to wishlist'),
                //             actions: [
                //               MaterialButton(
                //                 onPressed: () {
                //                   Navigator.of(context).pop(context);
                //                 },
                //                 child: Text('close'),
                //               ),
                //             ],
                //           );
                //         },
                //       );
                //       wishList.add(widget.product);
                //     },
                //   ),
                // )
              ],
            ),
            SizedBox(
              height: 140,
              child: Image.network(
                "${widget.product.images![0].src}",
                fit: BoxFit.cover,
              ),
            ),
            // Text(
            //   "${widget.product.price} RWF",
            //   style:
            //       TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            // ),
            Text(
              "${proname.length > 20 ? proname.substring(0, 19) + ".." : proname}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
