import 'dart:io';

class ProductEntity {
  final String name;
  final String code;
  final num price;
  final String description;
  final bool? isFeatured;
  final String imageUrl;
  final File image;

  ProductEntity({
    required this.imageUrl,
    this.isFeatured,
    required this.name,
    required this.code,
    required this.price,
    required this.description,
    required this.image,
  });
}
