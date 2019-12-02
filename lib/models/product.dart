class Product {
  static const NAME_KEY = 'name';

  Product.create(this.name);

  String name;
  String id;
  int amount;

  Product.fromFirestore(Map<String, dynamic> json) {
    name = json[NAME_KEY];
  }

  @override
  bool operator ==(o) => o is Product && o.name == name && o.id == id;

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
