import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fruits_dashboard/core/error/failure.dart';
import 'package:fruits_dashboard/core/error/server_failure.dart';
import 'package:fruits_dashboard/core/services/database_service.dart';
import 'package:fruits_dashboard/core/services/storage_service.dart';
import 'package:fruits_dashboard/core/utils/endoints.dart';
import 'package:fruits_dashboard/features/dashboard/data/models/product_model.dart';
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
  Future<Either<Failure, void>> addProduct({
    required ProductEntity product,
  }) async {
    try {
      databaseService.addData(
        path: Endpoints.products,
        data: ProductModel.fromEntity(product).toJson(),
      );
      return right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return left(
          ServerFailure.fromFirestore(e),
        );
      }
      return left(
        ServerFailure(
          errMessage: 'Failed to add product',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String>> uploadFile({
    required File file,
  }) async {
    try {
      String imageUrl = await storageService.uploadFile(
        file: file,
        path: Endpoints.images,
      );
      return right(imageUrl);
    } catch (e) {
      log(e.toString());
      return left(
        ServerFailure(
          errMessage: 'Failed to upload image',
        ),
      );
    }
  }
}
