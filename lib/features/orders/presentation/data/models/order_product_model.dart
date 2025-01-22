
class OrderProductModel {
  final String code;
  final String name;
  final String imageUrl;
  final num price;
  final int quantity;

  OrderProductModel({
    required this.code,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });


  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      code: json['code'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  toJson() {
    return {
      'code': code,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }
}
