import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thenewspecies/pages/product_details.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:thenewspecies/store/cart.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
    return GridView.builder(
        itemCount: productsList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Consumer<CartStore>(
            builder: (context, cart, child) => SingleProd(
              prodName: productsList[index]['prodName'],
              prodImage: productsList[index]['prodImage'],
              oldPrice: productsList[index]['oldPrice'],
              price: productsList[index]['price'],
            ),
          );
        });
  }
}

class SingleProd extends StatelessWidget {
  final prodName;
  final prodImage;
  final oldPrice;
  final price;
  SingleProd({this.prodName, this.prodImage, this.oldPrice, this.price});
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
                header: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${price}Rwf",
                          style: TextStyle(
                            color: HexColor("9D0208"),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: HexColor("9D0208"),
                            size: 20,
                          ),
                          onPressed: () {},
                        )
                      ]),
                ),
                footer: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      prodName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Image.asset(
                    prodImage,
                    // fit: BoxFit.cover,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
