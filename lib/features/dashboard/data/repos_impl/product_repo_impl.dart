import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fruits_dashboard/core/error/failure.dart';
import 'package:fruits_dashboard/core/error/server_failure.dart';
import 'package:fruits_dashboard/core/services/database_service.dart';
import 'package:fruits_dashboard/core/services/storage_service.dart';
import 'package:fruits_dashboard/core/utils/endoints.dart';
import 'package:fruits_dashboard/features/dashboard/domain/entitis/product_entity.dart';
import 'package:fruits_dashboard/features/dashboard/domain/repos/product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  final DatabaseService databaseService;
  final StorageService storageService;

  ProductRepoImpl({
    required this.storageService,
    required this.databaseService,
  });
  @override
  Future<Either<Failure, Unit>> addProduct({
    required ProductEntity product,
  }) async {
    try {
      databaseService.addData(
        path: Endpoints.product,
        data: {
          'name': product.name,
          'code': product.code,
          'price': product.price,
          'description': product.description,
          'isFeatured': product.isFeatured,
          'image': product.image,
        },
      );
      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        return left(
          ServerFailure.fromFirestore(e),
        );
      }
      return left(
        ServerFailure(errMessage: 'Opps, There was an error'),
      );
    }
  }

  @override
  Future<Either<Failure, String>> uploadFile(
      {required File file, required String path}) async {
    try {
      String imageUrl = await storageService.uploadFile(
        file: file,
        path: Endpoints.images,
      );
      return right(imageUrl);
    } catch (e) {
      if (e is FirebaseException) {
        return left(
          ServerFailure.fromFirebaseStorage(e),
        );
      }
      return left(
        ServerFailure(errMessage: 'Faild to upload image'),
      );
    }
  }
}
