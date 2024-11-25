import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_dashboard/core/error/failure.dart';
import 'package:fruits_dashboard/features/dashboard/domain/entitis/product_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, void>> addProduct({
    required ProductEntity product,
  });

  Future<Either<Failure, String>> uploadFile({
    required File file,
  });
}
