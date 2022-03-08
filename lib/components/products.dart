import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thenewspecies/model/product.dart';
import 'package:thenewspecies/pages/product_details.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:thenewspecies/store/cart.dart';
import 'package:thenewspecies/store/wishList.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<Product> products = <Product>[];
  bool isLoading = true;
  late Product product;
  late List<Product> product1;
//   List<ac.Anime> animeList = new List<ac.Anime>();
// for(var item in jsonData){
//     ac.Anime anime = ac.Anime.fromJson(item);
//     animeList.add(item);
// }
  var data = [
    {
      "id": 2260,
      "name": "Iphone  13 pro",
      "price": "",
      "images": [
        {
          "id": 2183,
          "date_created": "2021-08-20T08:58:00",
          "date_created_gmt": "2021-08-20T08:58:00",
          "date_modified": "2022-03-04T06:12:31",
          "date_modified_gmt": "2022-03-04T06:12:31",
          "src":
              "http://thenewspecies.com/wp-content/uploads/2021/07/logooo2-1.jpg",
          "name": "",
          "alt": ""
        }
      ],
      "description": "",
      "category": [],
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
    },
    {
      "id": 2253,
      "name": "Apple Watch SE",
      "price": "450000",
      "images": [
        {
          "id": 2183,
          "date_created": "2021-08-20T08:58:00",
          "date_created_gmt": "2021-08-20T08:58:00",
          "date_modified": "2022-03-04T06:12:31",
          "date_modified_gmt": "2022-03-04T06:12:31",
          "src":
              "http://thenewspecies.com/wp-content/uploads/2021/07/logooo2-1.jpg",
          "name": "",
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
    },
    {
      "id": 2208,
      "name": "Iphone 13 pro max",
      "price": "1500000",
      "images": [
        {
          "id": 2210,
          "date_created": "2021-10-01T12:17:20",
          "date_created_gmt": "2021-10-01T12:17:20",
          "date_modified": "2021-10-01T12:17:20",
          "date_modified_gmt": "2021-10-01T12:17:20",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2021/10/iphone-13.jpg",
          "name": "iphone 13",
          "alt": ""
        }
      ],
      "description":
          "Super Retina XDR display with ProMotionProMotion technology with adaptive refresh rates up to 120HzA15 Bionic chipPro 12MP camera system: Telephoto, Wide, and Ultra Wide cameras100% Focus Pixels (Wide)Night modeCinematic mode for recording videos with shallow depth of field (1080p at 30 fps)HDR video recording with Dolby Vision up to 4K at 60 fps4K video recording at 24 fps, 25 fps, 30 fps, or 60 fpsFace id: Enabled by TrueDepth camera for facial recognitionvideo calling:FaceTime video calling over cellular or Wi‑FiFaceTime HD (1080p) video calling over 5G or Wi‑Fibattery: Video playback:Up to 22 hoursVideo playback (streamed):Up to 20 hoursAudio playback:Up to 75 hoursVideo playback:Up to 28 hoursVideo playback (streamed):Up to 25 hoursAudio playback:Up to 95 hoursFast-charge capable:Up to 50% charge in around 30 minutes14 with 20W adapter or higher (available separately)",
      "category": [
        {"id": 59, "name": "Electronics", "slug": "electronics"},
        {"id": 33, "name": "Most Popular", "slug": "most-popular"},
        {"id": 35, "name": "New Arrival", "slug": "new-arrival"},
        {"id": 36, "name": "On Sale", "slug": "on-sale"},
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
      "id": 2203,
      "name": "JBL TUNE500 HeadSet",
      "price": "40000",
      "images": [
        {
          "id": 2205,
          "date_created": "2021-09-29T07:22:05",
          "date_created_gmt": "2021-09-29T07:22:05",
          "date_modified": "2021-09-29T07:22:05",
          "date_modified_gmt": "2021-09-29T07:22:05",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2021/09/jbl-h1.jpg",
          "name": "jbl h1",
          "alt": ""
        },
        {
          "id": 2206,
          "date_created": "2021-09-29T07:22:29",
          "date_created_gmt": "2021-09-29T07:22:29",
          "date_modified": "2021-09-29T07:22:29",
          "date_modified_gmt": "2021-09-29T07:22:29",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2021/09/jbl-h.jpg",
          "name": "jbl h",
          "alt": ""
        },
        {
          "id": 2204,
          "date_created": "2021-09-29T07:21:45",
          "date_created_gmt": "2021-09-29T07:21:45",
          "date_modified": "2021-09-29T07:21:45",
          "date_modified_gmt": "2021-09-29T07:21:45",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2021/09/jbl-h2.jpg",
          "name": "jbl h2",
          "alt": ""
        }
      ],
      "description":
          "The JBL TUNE500 powerful sound to spark up your day. Equipped with JBL Pure Bass sound, 32mm JBL drivers, and a one-button universal remote that is compatible with most smartphones, these headphones provide quick access to great sound every time. Lightweight and comfortable thanks to the soft ear cushions and padded headband, the JBL TUNE500 headphones also allow you to connect to Siri or Google Now without using your mobile device. Available in 4 fresh colors that feature a tangle-free flat cable and foldable for easy portability, the JBL TUNE500 headphones are a plug ‘n go solution that enable you to inject music into every aspect of your busy life.",
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
      "id": 2198,
      "name":
          "Sony WH1000XM3 Noise Cancelling Headphones, Wireless Bluetooth Headset",
      "price": "300000",
      "images": [
        {
          "id": 2200,
          "date_created": "2021-09-24T08:54:50",
          "date_created_gmt": "2021-09-24T08:54:50",
          "date_modified": "2021-09-24T08:54:50",
          "date_modified_gmt": "2021-09-24T08:54:50",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2021/09/sony1.jpg",
          "name": "sony1",
          "alt": ""
        },
        {
          "id": 2201,
          "date_created": "2021-09-24T08:55:50",
          "date_created_gmt": "2021-09-24T08:55:50",
          "date_modified": "2021-09-24T08:55:50",
          "date_modified_gmt": "2021-09-24T08:55:50",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2021/09/sony2.jpg",
          "name": "sony2",
          "alt": ""
        },
        {
          "id": 2199,
          "date_created": "2021-09-24T08:53:16",
          "date_created_gmt": "2021-09-24T08:53:16",
          "date_modified": "2021-09-24T08:53:16",
          "date_modified_gmt": "2021-09-24T08:53:16",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2021/09/sony.jpg",
          "name": "sony",
          "alt": ""
        }
      ],
      "description":
          "DIGITAL NOISE CANCELING: Industry leading ANC lends a personalized, virtually soundproof experiencePHONE CALL: A built-in mic enables you to take hands-free calls.VOICE ASSISTANT: Alexa enabled for voice access to music, information and more. Activate with a simple touchQUICK ATTENTION MODE: Cover the right ear cup to turn down your music for instant, easy conversationPERSONAL NOISE CANCELLING: Adjusts ambient sound to your activity for the best noise cancellationTOUCH CONTROLS: Control music tracks and volume, activate your voice assistant and take phone callsLONG BATTERY LIFE: A single charge provides up to 30 hrs of playtime for reliable all day listening",
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
      "id": 2191,
      "name": "HAING Laptop Cooling Stand",
      "price": "30000",
      "images": [
        {
          "id": 2192,
          "date_created": "2021-09-01T18:52:34",
          "date_created_gmt": "2021-09-01T18:52:34",
          "date_modified": "2021-09-01T18:52:34",
          "date_modified_gmt": "2021-09-01T18:52:34",
          "src": "https://thenewspecies.com/wp-content/uploads/2021/09/coo.jpg",
          "name": "coo",
          "alt": ""
        },
        {
          "id": 2193,
          "date_created": "2021-09-01T18:53:36",
          "date_created_gmt": "2021-09-01T18:53:36",
          "date_modified": "2021-09-01T18:53:36",
          "date_modified_gmt": "2021-09-01T18:53:36",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2021/09/coo3.jpg",
          "name": "coo3",
          "alt": ""
        },
        {
          "id": 2194,
          "date_created": "2021-09-01T18:53:40",
          "date_created_gmt": "2021-09-01T18:53:40",
          "date_modified": "2021-09-01T18:53:40",
          "date_modified_gmt": "2021-09-01T18:53:40",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2021/09/coo2.png",
          "name": "coo2",
          "alt": ""
        }
      ],
      "description":
          "Fits any Laptop, Notebook, Ultrabook, or Netbook, Xbox, PS4, PS3, And any console from 9″, 14″, 15.6″, and even up to 17″.High Performance Fans with little to no sound rated at a 15 dBA Noise Level.Fits Lap and other Surfaces comfortably with no constraint to the Fans Performance.Adjustable Feet provide multiple angles and height adjustments, for a perfect typing and viewing angle.",
      "category": [
        {"id": 170, "name": "Gadgets", "slug": "gadgets"},
        {"id": 33, "name": "Most Popular", "slug": "most-popular"},
        {"id": 35, "name": "New Arrival", "slug": "new-arrival"},
        {"id": 36, "name": "On Sale", "slug": "on-sale"}
      ],
      "quantity": 1
    },
    {
      "id": 2167,
      "name": "JBL PartyBox 110",
      "price": "750000",
      "images": [
        {
          "id": 2168,
          "date_created": "2021-08-20T08:38:35",
          "date_created_gmt": "2021-08-20T08:38:35",
          "date_modified": "2021-08-20T08:38:35",
          "date_modified_gmt": "2021-08-20T08:38:35",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2021/08/jbl-1.jpg",
          "name": "jbl 1",
          "alt": ""
        },
        {
          "id": 2169,
          "date_created": "2021-08-20T08:39:28",
          "date_created_gmt": "2021-08-20T08:39:28",
          "date_modified": "2021-08-20T08:39:28",
          "date_modified_gmt": "2021-08-20T08:39:28",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2021/08/jbl-2.jpg",
          "name": "jbl 2",
          "alt": ""
        },
        {
          "id": 2170,
          "date_created": "2021-08-20T08:39:32",
          "date_created_gmt": "2021-08-20T08:39:32",
          "date_modified": "2021-08-20T08:39:32",
          "date_modified_gmt": "2021-08-20T08:39:32",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2021/08/jbl-3.jpg",
          "name": "jbl 3",
          "alt": ""
        },
        {
          "id": 2171,
          "date_created": "2021-08-20T08:39:43",
          "date_created_gmt": "2021-08-20T08:39:43",
          "date_modified": "2021-08-20T08:39:43",
          "date_modified_gmt": "2021-08-20T08:39:43",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2021/08/jbl-4.jpg",
          "name": "jbl 4",
          "alt": ""
        },
        {
          "id": 2172,
          "date_created": "2021-08-20T08:40:06",
          "date_created_gmt": "2021-08-20T08:40:06",
          "date_modified": "2021-08-20T08:40:06",
          "date_modified_gmt": "2021-08-20T08:40:06",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2021/08/jbl-5.png",
          "name": "jbl 5",
          "alt": ""
        },
        {
          "id": 2175,
          "date_created": "2021-08-20T08:43:43",
          "date_created_gmt": "2021-08-20T08:43:43",
          "date_modified": "2021-08-20T08:43:43",
          "date_modified_gmt": "2021-08-20T08:43:43",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2021/08/jbl-6-2.jpg",
          "name": "jbl 6",
          "alt": ""
        }
      ],
      "description":
          "POWERFUL JBL ORIGINAL PRO SOUND: Whether you&#8217;re at home or outdoors, the JBL PartyBox 110 makes your music amazing with two levels of deep, adjustable bass and 160W powerful JBL Signature Sound.12 HOURS OF PLAYTIME AND PORTABLE DESIGN: Power the party all day or all night. With 12 hours of playtime and a built-in rechargeable battery, the beat will go on (and on)!IPX4 SPLASHPROOF: Whether your guests are dancing on the beach or sipping drinks by the pool, the JBL PartyBox 110 is IPX4 splashproof so you never have to worry about the party getting too wet and wild.PARTYBOX APP: The JBL PartyBox app makes it easier than ever to control your music, update settings, and customize the colors and patterns of your light show for the perfect party vibe.PARTY LIGHTS: Every kind of music is better with a dynamic light show! Colors synched to the beat make you want to move your feet, while customizable strobes and patterns dazzle your eyes. It&#8217;s a unique, immersive audiovisual experience that transforms any party into a work of art",
      "category": [
        {"id": 19, "name": "Audio", "slug": "audio"},
        {"id": 41, "name": "Speaker", "slug": "speaker"}
      ],
      "quantity": 1
    },
    {
      "id": 2157,
      "name": "JBL PARTY box 100",
      "price": "600000",
      "images": [
        {
          "id": 2159,
          "date_created": "2021-08-20T08:02:35",
          "date_created_gmt": "2021-08-20T08:02:35",
          "date_modified": "2021-08-20T08:02:35",
          "date_modified_gmt": "2021-08-20T08:02:35",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2021/08/jbl-12.jpg",
          "name": "jbl 12",
          "alt": ""
        },
        {
          "id": 2160,
          "date_created": "2021-08-20T08:03:20",
          "date_created_gmt": "2021-08-20T08:03:20",
          "date_modified": "2021-08-20T08:03:20",
          "date_modified_gmt": "2021-08-20T08:03:20",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2021/08/jbl-13.png",
          "name": "jbl 13",
          "alt": ""
        },
        {
          "id": 2164,
          "date_created": "2021-08-20T08:08:17",
          "date_created_gmt": "2021-08-20T08:08:17",
          "date_modified": "2021-08-20T08:08:17",
          "date_modified_gmt": "2021-08-20T08:08:17",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2021/08/jbl-17.jpg",
          "name": "jbl 17",
          "alt": ""
        },
        {
          "id": 2161,
          "date_created": "2021-08-20T08:03:36",
          "date_created_gmt": "2021-08-20T08:03:36",
          "date_modified": "2021-08-20T08:03:36",
          "date_modified_gmt": "2021-08-20T08:03:36",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2021/08/jbl-14.jpg",
          "name": "jbl 14",
          "alt": ""
        },
        {
          "id": 2162,
          "date_created": "2021-08-20T08:03:52",
          "date_created_gmt": "2021-08-20T08:03:52",
          "date_modified": "2021-08-20T08:03:52",
          "date_modified_gmt": "2021-08-20T08:03:52",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2021/08/jbl-15.jpg",
          "name": "jbl 15",
          "alt": ""
        },
        {
          "id": 2163,
          "date_created": "2021-08-20T08:03:59",
          "date_created_gmt": "2021-08-20T08:03:59",
          "date_modified": "2021-08-20T08:03:59",
          "date_modified_gmt": "2021-08-20T08:03:59",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2021/08/jbl-16.jpg",
          "name": "jbl 16",
          "alt": ""
        }
      ],
      "description":
          "Bring the party with the portable power of JBL PartyBox 100. Ignite the night. Pick the perfect light show or let the music choose the mood. Mix it up. Pop in a playlist from your USB stick or stream from a Bluetooth-compatible device. Rock out on the fly with mic and guitar inputs. Find your sweet spot. Mount your speaker on a pole and immerse the room in dynamic JBL sound. Go all night with up to 12 hours of battery life. Plug your speaker into the wall to keep the tunes flowing",
      "category": [
        {"id": 19, "name": "Audio", "slug": "audio"},
        {"id": 41, "name": "Speaker", "slug": "speaker"}
      ],
      "quantity": 1
    },
    {
      "id": 2141,
      "name": "Louis Vuitton",
      "price": "15000",
      "images": [
        {
          "id": 2143,
          "date_created": "2021-07-24T18:33:59",
          "date_created_gmt": "2021-07-24T18:33:59",
          "date_modified": "2021-07-24T18:33:59",
          "date_modified_gmt": "2021-07-24T18:33:59",
          "src":
              "https://thenewspecies.com/wp-content/uploads/2021/07/0c9e8864c5016e00da326f1bfcabc068.jpg",
          "name": "0c9e8864c5016e00da326f1bfcabc068",
          "alt": ""
        }
      ],
      "description":
          "Compatible with iPhone Models, and Compatible Wireless Charging.The Luxury Leather Case provides an elegant and fashionable look and feel. Ultra-slim.Made with advanced PU leather which makes this wallet case comfortable to touch and grip.For: iPhone  11,12promax.",
      "category": [
        {"id": 17, "name": "Accessories", "slug": "accessories"},
        {"id": 103, "name": "cover", "slug": "cover"}
      ],
      "quantity": 1
    }
  ];
  Future<List<Product>> fetchProducts() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://newspeciesendpointswoocomerce.herokuapp.com/products'));
    request.body = '''{\n    "per_page":50\n}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonData = convert.jsonDecode(await response.stream.bytesToString());

      for (var item in jsonData) {
        Product product = Product.fromJson(item);
        products.add(product);
      }

      print(products);
      //  product = Product.fromJson(indexedData);
      // product1.add(product);r
      // print(indexedData[2]);
      setState(() {
        // products = product as List;
        isLoading = false;
      });
      return products;
      // print(jsonData);
    } else {
      print(response.reasonPhrase);
      return products;
    }
    //
  }

  Future<List<Product>> fetchProducts1() async {
    var jsonData = convert.jsonDecode(data.toString());

    for (var item in jsonData) {
      Product product = Product.fromJson(item);
      products.add(product);
    }

    print(jsonData);
    //  product = Product.fromJson(indexedData);
    // product1.add(product);r
    // print(indexedData[2]);
    setState(() {
      // products = product as List;
      isLoading = false;
    });
    return products;
    // print(jsonData);

    //
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchProducts();
  }

  var productsList = [
    {
      'prodName': 'blazer',
      'prodImage': 'images/products/blazer1.jpeg',
      'oldPrice': '120',
      'price': '90',
    },
  ];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        // : FutureBuilder<List<Product>>(
        //     future: fetchProducts(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         return GridView.builder(
        //             itemCount: 100,
        //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //                 crossAxisCount: 2),
        //             itemBuilder: (BuildContext context, int index) {
        //               return Consumer<CartStore>(
        //                 builder: (context, cart, child) => SingleProd(
        //                   product: snapshot.data,
        //                 ),
        //               );
        //             });
        //       } else {
        //         return CircularProgressIndicator();
        //       }
        //     });
        : Container(
            height: screenHeight,
            padding: EdgeInsets.only(left: 15, right: 15),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Consumer<CartStore>(
                      builder: (context, cart, child) => SingleProd(
                        product: products[index],
                      ),
                    ),
                  );
                }),
          );
  }
}

class SingleProd extends StatelessWidget {
  Product product;
  // final prodName;
  // final prodImage;
  // final oldPrice;
  // final price;

  SingleProd({required this.product});
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    String proname = product.name.toString();
    return Card(
      child: Hero(
        tag:
            '${proname.length > 20 ? proname.substring(0, 20) + "..." : proname}',
        child: Material(
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
            Radius.circular(16.0),
          )),
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                //here we are passing the data of product
                builder: (context) => ProductDetails(
                      product: product,
                    ))),
            child: GridTile(
                header: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Text(
                        //   "${product.price}Rwf",
                        //   style: TextStyle(
                        //     color: HexColor("9D0208"),
                        //   ),
                        // ),
                        Consumer<WishListStore>(
                          builder: (context, wishList, child) => IconButton(
                            icon: wishList.exist(
                              product,
                            )
                                ? Icon(
                                    Icons.favorite,
                                    color: HexColor("9D0208"),
                                    size: 20,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    color: HexColor("9D0208"),
                                    size: 20,
                                  ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    // title: Text('Quantity'),
                                    content: Text('Product added to wishlist'),
                                    actions: [
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(context);
                                        },
                                        child: Text('close'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              wishList.add(product);
                            },
                          ),
                        )
                      ]),
                ),
                footer: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${proname.length > 20 ? proname.substring(0, 20) + "..." : proname}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenHeight / 53,
                      ),
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenHeight / 25),
                  child: Image.network(
                    "${product.images![0].src}",
                    fit: BoxFit.cover,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
