import 'package:fruits_dashboard/features/add_product/domain/entitis/review_entity.dart';

class ProductEntity {
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
  final List<ReviewEntity>? reviews;

  ProductEntity({
    required this.avgRating,
    required this.numberOfRating,
    required this.reviews,
    required this.expirationMonths,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitWeight,
    required this.imageUrl,
    required this.isFeatured,
    required this.name,
    required this.code,
    required this.price,
    required this.description,
  });
}
