import 'package:dartz/dartz.dart';
import 'package:fruits_dashboard/core/error/failure.dart';
import 'package:fruits_dashboard/features/orders/domain/entities/order_entity/order_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, List<OrderEntity>>> getOrders();
}
