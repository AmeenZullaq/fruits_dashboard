import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dashboard/core/helper_function/get_dummy_order.dart';
import 'package:fruits_dashboard/features/orders/presentation/cubits/cubit/order_cubit.dart';
import 'package:fruits_dashboard/features/orders/presentation/views/widgets/orders_list_view.dart';

class OrderListViewBlocBuilder extends StatelessWidget {
  const OrderListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrderFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is OrderSuccess) {
          return OrdersListView(orders: state.orders);
        } else {
          return OrdersListView(orders: [
            getDummyOrder(),
            getDummyOrder(),
            getDummyOrder(),
          ]);
        }
      },
    );
  }
}
