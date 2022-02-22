import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Categories(
            'Accessories',
            'images/cats/accessories.png',
          ),
          Categories(
            'Dress',
            'images/cats/dress.png',
          ),
          Categories(
            'T-shirt',
            'images/cats/formal.png',
          ),
          Categories(
            'Jeans',
            'images/cats/jeans.png',
          ),
          Categories(
            'T-shirt',
            'images/cats/informal.png',
          ),
          Categories(
            'Shoes',
            'images/cats/shoe.png',
          ),
          Categories(
            'T-shirt',
            'images/cats/tshirt.png',
          ),
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;
  Categories(this.imageCaption, this.imageLocation);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Image.asset(
              imageLocation,
              width: 80.0,
              height: 60.0,
            ),
            Text(imageCaption)
          ],
        ),
      ),
    );
  }
}
