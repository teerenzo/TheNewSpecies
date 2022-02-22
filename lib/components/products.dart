import 'package:flutter/material.dart';
import 'package:thenewspecies/pages/product_details.dart';

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
      'prodName': 'Hill',
      'prodImage': 'images/products/hills1.jpeg',
      'oldPrice': '180',
      'price': '170',
    },
    {
      'prodName': 'Hill 2',
      'prodImage': 'images/products/hills2.jpeg',
      'oldPrice': '160',
      'price': '120',
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
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProd(
            prodName: productsList[index]['prodName'],
            prodImage: productsList[index]['prodImage'],
            oldPrice: productsList[index]['oldPrice'],
            price: productsList[index]['price'],
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
