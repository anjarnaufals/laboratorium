class Product {
  String? id;
  String? name;
  int? qty;
  int? price;

  Product({this.id, this.name, this.qty, this.price});

  Product.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.qty = json['qty'];
    this.price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['qty'] = this.qty;
    data['price'] = this.price;
    return data;
  }
}
