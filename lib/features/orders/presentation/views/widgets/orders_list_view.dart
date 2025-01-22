import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_dashboard/core/helper_function/get_dummy_order.dart';
import 'package:fruits_dashboard/features/orders/presentation/data/models/order_model.dart';
import 'package:fruits_dashboard/features/orders/presentation/views/widgets/order_card.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key, required this.orders});

  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: orders.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return OrderCard(
          order: getDummyOrder(),
        );
      },
      separatorBuilder: (_, __) => SizedBox(
        height: 12.h,
      ),
    );
  }
}
