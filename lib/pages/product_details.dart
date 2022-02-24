import 'package:flutter/material.dart';
import 'package:thenewspecies/components/bottomNavigation.dart';
import 'package:thenewspecies/model/product.dart';
import 'package:thenewspecies/pages/cart.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:thenewspecies/store/cart.dart';
import 'package:thenewspecies/store/wishList.dart';

class ProductDetails extends StatefulWidget {
  final productDetailName;
  final productDetailImage;
  final productDetailPrice;
  final productDetailOldPrice;

  ProductDetails(
      {this.productDetailName,
      this.productDetailImage,
      this.productDetailPrice,
      this.productDetailOldPrice});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("F2E5E5"),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: HexColor("9D0208"),
        title: Text(widget.productDetailName),
        actions: [
          IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: null),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Cart(),
                ),
              );
            },
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBtn(),
      body: ListView(
        children: [
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(
                  widget.productDetailImage,
                  // fit: BoxFit.cover,
                ),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.productDetailName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        child: Text("\$${widget.productDetailOldPrice}",
                            style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough)),
                      ),
                      Expanded(
                        child: Text(
                          "\$${widget.productDetailPrice}",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //======the first buttons =======
          Row(
            children: [
              //======the sise button======
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Size'),
                          content: Text('choose the size'),
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
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Size'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),

              //======the sise button======
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Color'),
                          content: Text('choose a color'),
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
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Color'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),

              //======the sise button======
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Quantity'),
                          content: Text('choose quantity'),
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
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Quantity'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: [
              //======the sise button======
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: HexColor("9D0208"),
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: Text('Buy Now'),
                ),
              ),
              Consumer<CartStore>(
                builder: (context, cart, child) => new IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // title: Text('Quantity'),
                          content: Text('Product added to Cart'),
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
                    cart.add(
                      Product(
                          widget.productDetailName,
                          widget.productDetailImage,
                          widget.productDetailOldPrice,
                          widget.productDetailPrice,
                          1),
                    );
                  },
                  color: HexColor("9D0208"),
                ),
              ),

              Consumer<WishListStore>(
                builder: (context, wishList, child) => new IconButton(
                  icon: wishList.exist(
                    Product(
                        widget.productDetailName,
                        widget.productDetailImage,
                        widget.productDetailOldPrice,
                        widget.productDetailPrice,
                        1),
                  )
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border),
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
                    wishList.add(
                      Product(
                          widget.productDetailName,
                          widget.productDetailImage,
                          widget.productDetailOldPrice,
                          widget.productDetailPrice,
                          1),
                    );
                  },
                  color: HexColor("9D0208"),
                ),
              )
            ],
          ),
          Divider(),
          ListTile(
            title: Text(
              'Descriptions',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
                'this product is made in rwanda by company called "T ART&DESIGN Ltd. and is product is availbe in all sizes and colors'),
          ),
          Divider(),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product Condiction',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                //fix Later
                child: Text("condiction"),
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Similar Products'),
          ),
          Container(
            height: 260.0,
            child: SimilarProduct(),
          )
        ],
      ),
    );
  }
}

class SimilarProduct extends StatefulWidget {
  @override
  _SimilarProductState createState() => _SimilarProductState();
}

class _SimilarProductState extends State<SimilarProduct> {
  var productsList = [
    {
      'prodName': 'blazer',
      'prodImage': 'images/products/blazer1.jpeg',
      'oldPrice': '120',
      'price': '90',
    },
    {
      'prodName': 'Pant',
      'prodImage': 'images/products/pants2.jpeg',
      'oldPrice': '90',
      'price': '81',
    },
    {
      'prodName': 'Red dress',
      'prodImage': 'images/products/dress1.jpeg',
      'oldPrice': '180',
      'price': '140',
    },
    {
      'prodName': 'blazer 2',
      'prodImage': 'images/products/blazer2.jpeg',
      'oldPrice': '200',
      'price': '180',
    },
    {
      'prodName': 'dress',
      'prodImage': 'images/products/dress2.jpeg',
      'oldPrice': '180',
      'price': '170',
    },
    {
      'prodName': 'skt',
      'prodImage': 'images/products/skt1.jpeg',
      'oldPrice': '180',
      'price': '170',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productsList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return SimilarSingleProd(
            prodName: productsList[index]['prodName'],
            prodImage: productsList[index]['prodImage'],
            oldPrice: productsList[index]['oldPrice'],
            price: productsList[index]['price'],
          );
        });
  }
}

class SimilarSingleProd extends StatelessWidget {
  final prodName;
  final prodImage;
  final oldPrice;
  final price;
  SimilarSingleProd({this.prodName, this.prodImage, this.oldPrice, this.price});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prodName,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                //here we are passing the data of product
                builder: (context) => ProductDetails(
                      productDetailName: prodName,
                      productDetailImage: prodImage,
                      productDetailOldPrice: oldPrice,
                      productDetailPrice: price,
                    ))),
            child: GridTile(
                footer: Container(
                  color: Colors.white70,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          prodName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Text(
                        "\$$price",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
                child: Image.asset(
                  prodImage,
                  fit: BoxFit.cover,
                )),
          ),
        ),
      ),
    );
  }
}
