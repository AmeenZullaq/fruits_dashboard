import 'package:fruits_dashboard/features/add_product/domain/entitis/review_entity.dart';

class ReviewModel {
  final String image;
  final String name;
  final num rating;
  final String date;
  final String reviewDescription;

  ReviewModel({
    required this.image,
    required this.name,
    required this.rating,
    required this.date,
    required this.reviewDescription,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      image: json['image'],
      name: json['name'],
      rating: json['rating'],
      date: json['date'],
      reviewDescription: json['reviewDescription'],
    );
  }

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      image: reviewEntity.image,
      name: reviewEntity.name,
      rating: reviewEntity.rating,
      date: reviewEntity.date,
      reviewDescription: reviewEntity.reviewDescription,
    );
  }

  toJson() {
    return {
      'image': image,
      'name': name,
      'rating': rating,
      'date': date,
      'reviewDescription': reviewDescription,
    };
  }
}
