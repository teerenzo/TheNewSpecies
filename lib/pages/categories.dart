import 'package:flutter/material.dart';
import 'package:newspecies/components/horizontal_listView.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("All Categories"),
      ),
      body: Container(height: screenHeight, child: HorizontalList()),
    );
  }
}
