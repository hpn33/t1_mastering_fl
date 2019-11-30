import 'package:flutter/material.dart';
import 'package:t1_mastering_fl/models/product.dart';

class SelectedCategoryPage extends StatelessWidget {
  const SelectedCategoryPage({
    Key key,
    @required this.products,
  }) : super(key: key);
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('selected category page'),
      ),
      body: ListView(
        children: products.map((product) {
          return Text(product.name);
        }).toList(),
      ),
    );
  }
}
