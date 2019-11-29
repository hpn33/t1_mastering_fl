import 'dart:async';

import 'package:t1_mastering_fl/models/Category.dart';
import 'package:t1_mastering_fl/widgets/bloc_provider.dart';

class CategoryBloc implements BlocBase {

  List<Category> _categores;

  var _categoresController = StreamController<List<Category>>();
  get _inCategores => _categoresController.sink;
  get _outCategores => _categoresController.stream;

  @override
    void dispose() {
      _categoresController.close();
  }
}