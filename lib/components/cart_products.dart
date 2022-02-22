import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productOnTheCart = [
    {
      'prodName': 'blazer 2',
      'prodImage': 'images/products/blazer2.jpeg',
      'price': 180,
      'size': 'M',
      'color': 'red',
      'quantity': 1
    },
    {
      'prodName': 'dress',
      'prodImage': 'images/products/dress1.jpeg',
      'price': 50,
      'size': 'M',
      'color': 'red',
      'quantity': 1
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: productOnTheCart.length,
        itemBuilder: (context, index) {
          return SingleCartProduct(
            prodName: productOnTheCart[index]["prodName"],
            prodImage: productOnTheCart[index]["prodImage"],
            prodColor: productOnTheCart[index]["color"],
            prodSize: productOnTheCart[index]["size"],
            price: productOnTheCart[index]["price"],
            prodQuantity: productOnTheCart[index]["quantity"],
          );
        });
  }
}

class SingleCartProduct extends StatelessWidget {
  final prodName;
  final prodImage;
  final price;
  final prodSize;
  final prodColor;
  final prodQuantity;

  SingleCartProduct({
    this.prodName,
    this.prodImage,
    this.prodColor,
    this.price,
    this.prodQuantity,
    this.prodSize,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(prodImage),
        title: Text(prodName),
        subtitle: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Text("Size:"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      prodSize,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 15.0, 8.0, 8.0),
                    child: Text("Color:"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      prodColor,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "\$$price",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
              )
            ],
          ),
        ),
        trailing: Column(
          children: [
            InkWell(
              onTap: () {},
              child: Text(
                '+',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            Text("$prodQuantity"),
            InkWell(
              onTap: () {},
              child: Text(
                '-',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
