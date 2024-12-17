import 'package:fruits_dashboard/features/add_product/data/models/review_model.dart';
import 'package:fruits_dashboard/features/add_product/domain/entitis/product_entity.dart';

class ProductModel {
  final String name;
  final String code;
  final num price;
  final String description;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitWeight;
  final num avgRating;
  final int numberOfRating;
  final int sellingCount;
  final List<ReviewModel>? reviews;

  ProductModel({
    this.sellingCount = 0,
    required this.avgRating,
    required this.numberOfRating,
    required this.reviews,
    required this.imageUrl,
    required this.isFeatured,
    required this.name,
    required this.code,
    required this.price,
    required this.description,
    required this.expirationMonths,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitWeight,
  });

  factory ProductModel.fromEntity(ProductEntity product) {
    return ProductModel(
      imageUrl: product.imageUrl,
      name: product.name,
      code: product.code,
      price: product.price,
      description: product.description,
      expirationMonths: product.expirationMonths,
      isOrganic: product.isOrganic,
      numberOfCalories: product.numberOfCalories,
      unitWeight: product.unitWeight,
      isFeatured: product.isFeatured,
      avgRating: product.avgRating,
      numberOfRating: product.numberOfRating,
      reviews: product.reviews?.map((e) => ReviewModel.fromEntity(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'price': price,
      'description': description,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationMonths': expirationMonths,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'intunitWeight': unitWeight,
      'sellingCount': sellingCount,
    };
  }
}
