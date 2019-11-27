import 'package:t1_mastering_fl/models/Category.dart';

class DdApi {
  List<Category> getCategorys() {

    List<Category> tempCategory = [];

    for (var i = 0; i < 10; i++) {
      tempCategory.add(Category());
    }

    return tempCategory;
  }
}