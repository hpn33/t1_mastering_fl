import 'dart:async';

import 'package:t1_mastering_fl/api/db_api.dart';
import 'package:t1_mastering_fl/models/Category.dart';
import 'package:t1_mastering_fl/widgets/bloc_provider.dart';

class CategoriesBloc implements BlocBase {
  var _categories = List<Category>();

  var _categoriesController = StreamController<List<Category>>();
  get _inCategories => _categoriesController.sink;
  get outCategories => _categoriesController.stream;

  CategoriesBloc() {
    getCategories();
  }

  @override
  void dispose() {
    _categoriesController.close();
  }

  // void getCategories() {
  //   var dbApi = DbApi.instance;
  //   _categories = dbApi.getCategories();
  //   _inCategories.add(_categories);
  // }

  void getCategories() {
    var dbApi = DbApi.instance;
    dbApi.getCategories().listen((snapshot) {
      var tempCategories = List<Category>();
      for (var doc in snapshot.documents) {
        var category = Category.fromFirebase(doc.data);
        category.id = doc.documentID;
        tempCategories.add(category);
      }
      _categories.clear();
      _categories.addAll(tempCategories);
      _inCategories.add(_categories);
    });
  }
}
