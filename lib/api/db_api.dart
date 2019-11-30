import 'package:t1_mastering_fl/models/Category.dart';
import 'package:t1_mastering_fl/models/product.dart';

class DbApi {

  static final instance = DbApi();

  List<Category> getCategories() {

    List<Category> tempCategory = [];

    for (var i = 0; i < 10; i++) {
      tempCategory.add(Category());
    }

    return tempCategory;
  }

  List<Product> getProducts(Category category) {
    
    List<Product> tempProduct = [];

    for (var i = 0; i < 10; i++) {
      tempProduct.add(Product.create('prodcut'));
    }

    return tempProduct;
  }
}