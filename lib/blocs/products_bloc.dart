import 'dart:async';

import 'package:t1_mastering_fl/api/db_api.dart';
import 'package:t1_mastering_fl/models/Category.dart';
import 'package:t1_mastering_fl/models/product.dart';
import 'package:t1_mastering_fl/widgets/bloc_provider.dart';

class ProductsBloc implements BlocBase {
  var _products = List<Product>();

  final _productController = StreamController<List<Product>>();
  get _inProducts => _productController.sink;
  get outProducts => _productController.stream;

  ProductsBloc(Category category) {
    getProducts(category);
  }

//   void getProducts(Category category) {
//     var db = DbApi.instance;
//     _products = db.getProducts(category);
//     _inProducts.add(_products);
//   }

  void getProducts(Category category) {
    var dbApi = DbApi.instance;
    dbApi.getProducts(category).listen((snapshot) {
      var tempProducts = List<Product>();
      for (var doc in snapshot.documents) {
        var product = Product.fromFirestore(doc.data);
        product.id = doc.documentID;
        tempProducts.add(product);
      }
      _products.clear();
      _products.addAll(tempProducts);
      //_inProducts.add(_products);
    });
  }

  @override
  void dispose() {
    _productController.close();
  }
}
