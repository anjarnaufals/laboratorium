class Product {
  String? id;
  String? name;
  int? qty;
  int? price;

  Product({this.id, this.name, this.qty, this.price});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    qty = json['qty'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['qty'] = qty;
    data['price'] = price;
    return data;
  }
}
