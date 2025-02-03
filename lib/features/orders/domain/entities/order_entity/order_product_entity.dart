class OrderProductEntity {
  final String code;
  final String name;
  final String imageUrl;
  final num price;
  final int quantity;

  OrderProductEntity({
    required this.code,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });
}
