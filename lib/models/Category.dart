
class Category {
  static const NAME_KEY = 'name';

  String id, name;

  Category() {
    name = 'board';
  }

  Category.fromFirebase(Map<String, dynamic> json) {
    name = json[NAME_KEY];
  }

}