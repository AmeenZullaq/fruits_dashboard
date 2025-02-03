import 'package:bloc/bloc.dart';
import 'package:fruits_dashboard/features/orders/domain/entities/order_entity/order_entity.dart';
import 'package:fruits_dashboard/features/orders/domain/repos/order_repo.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderRepo) : super(OrderInitial());

  final OrderRepo orderRepo;

  Future<void> getOrders() async {
    emit(
      OrderLoading(),
    );
    final resulte = await orderRepo.getOrders();
    resulte.fold(
      (failure) => emit(
        OrderFailure(errMessage: failure.errMessage),
      ),
      (orders) => emit(
        OrderSuccess(orders: orders),
      ),
    );
  }
}
