import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/utils/app_routes.dart';
import 'package:fruits_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruits_dashboard/features/add_product/presentation/views/dashboard_view.dart';
import 'package:fruits_dashboard/features/orders/presentation/views/orders_view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.dashboardView:
      return MaterialPageRoute(
        builder: (context) => const DashboardView(),
      );
    case AppRoutes.addProductView:
      return MaterialPageRoute(
        builder: (context) => const AddProductView(),
      );
    case AppRoutes.ordersView:
      return MaterialPageRoute(
        builder: (context) => const OrdersView(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
  }
}
