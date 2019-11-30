import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:t1_mastering_fl/models/cart.dart';
import 'package:t1_mastering_fl/models/product.dart';
import 'package:t1_mastering_fl/widgets/bloc_provider.dart';

class CartBloc implements BlocBase {
  var cart = Cart();

  final _productsController = BehaviorSubject<List<Product>>();
  Sink<List<Product>> get _inProducts => _productsController.sink;
  Stream<List<Product>> get outProducts => _productsController.stream;

  @override
  void dispose() {
    _productsController.close();
  }
}
