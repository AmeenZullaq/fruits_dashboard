import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fruits_dashboard/core/error/failure.dart';
import 'package:fruits_dashboard/core/error/server_failure.dart';
import 'package:fruits_dashboard/core/services/database_service.dart';
import 'package:fruits_dashboard/core/utils/endoints.dart';
import 'package:fruits_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruits_dashboard/features/orders/domain/entities/order_entity/order_entity.dart';
import 'package:fruits_dashboard/features/orders/domain/repos/order_repo.dart';

class OrderRepoImpl extends OrderRepo {
  final DatabaseService databaseService;

  OrderRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders() async {
    try {
      List<Map<String, dynamic>> data = await databaseService.getData(
        path: Endpoints.orders,
      );
      List<OrderEntity> orders = [];
      for (var element in data) {
        orders.add(
          OrderModel.fromJson(element).toEntity(),
        );
      }
      return right(orders);
    } catch (e) {
      if (e is FirebaseException) {
        return left(
          ServerFailure.fromFirestore(e),
        );
      }
      return left(
        ServerFailure(errMessage: e.toString()),
      );
    }
  }
}
