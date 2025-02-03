import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_dashboard/features/orders/presentation/cubits/cubit/order_cubit.dart';
import 'package:fruits_dashboard/features/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:fruits_dashboard/injection_container.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InjectionContainer.getIt.get<OrderCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Orders',
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: const OrdersViewBody(),
      ),
    );
  }
}
