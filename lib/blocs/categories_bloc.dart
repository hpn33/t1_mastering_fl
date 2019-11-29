import 'dart:async';

import 'package:t1_mastering_fl/api/db_api.dart';
import 'package:t1_mastering_fl/models/Category.dart';
import 'package:t1_mastering_fl/widgets/bloc_provider.dart';

class CategoriesBloc implements BlocBase {
  List<Category> _categories;

  var _categoriesController = StreamController<List<Category>>();
  get _inCategories => _categoriesController.sink;
  get _outCategories => _categoriesController.stream;

  CategoriesBloc() {
    getCategories();
  }

  @override
  void dispose() {
    _categoriesController.close();
  }

  void getCategories() {
    var dbApi = DbApi();
    _categories = dbApi.getCategories();
    _inCategories.add(_categories);
  }
}
