import 'dart:async';

import 'package:t1_mastering_fl/api/db_api.dart';
import 'package:t1_mastering_fl/models/Category.dart';
import 'package:t1_mastering_fl/models/product.dart';
import 'package:t1_mastering_fl/widgets/bloc_provider.dart';

class ProductsBloc implements BlocBase {
  List<Product> _products;

  final _productController = StreamController<List<Product>>();
  get _inProducts => _productController.sink;
  get outProducts => _productController.stream;

  ProductsBloc(Category category) {
    getProducts(category);
  }

  void getProducts(Category category) {
    var db = DbApi.instance;
    _products = db.getProducts(category);
    _inProducts.add(_products);
  }

  @override
  void dispose() {
    _productController.close();
  }
}
