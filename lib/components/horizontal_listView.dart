import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Categories(
            'Accessories',
            'images/cats/accessories.png',
          ),
          Categories(
            'Smartphones',
            'images/cats/dress.png',
          ),
          Categories(
            'Audio',
            'images/cats/formal.png',
          ),
          Categories(
            'TV',
            'images/cats/jeans.png',
          ),
          Categories(
            'Speaker',
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
      padding: EdgeInsets.all(13.0),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            // Image.asset(
            //   imageLocation,
            //   width: 80.0,
            //   height: 60.0,
            // ),
            Text(
              imageCaption,
              style: TextStyle(
                // fontWeight: FontWeight.w200,
                fontSize: 15.0,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
