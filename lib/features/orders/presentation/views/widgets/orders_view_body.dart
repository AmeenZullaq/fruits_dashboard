import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_dashboard/core/helper_function/get_dummy_order.dart';
import 'package:fruits_dashboard/features/orders/presentation/cubits/cubit/order_cubit.dart';
import 'package:fruits_dashboard/features/orders/presentation/views/widgets/filter_widget.dart';
import 'package:fruits_dashboard/features/orders/presentation/views/widgets/order_list_view_bloc_builder.dart';
import 'package:fruits_dashboard/features/orders/presentation/views/widgets/orders_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            const FilterWidget(),
            SizedBox(
              height: 30.h,
            ),
            const OrderListViewBlocBuilder(),
            // OrdersListView(
            //   orders: [
            //     getDummyOrder(),
            //     getDummyOrder(),
            //     getDummyOrder(),
            //     getDummyOrder(),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
