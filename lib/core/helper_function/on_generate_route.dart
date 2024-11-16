import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/utils/app_routes.dart';
import 'package:fruits_dashboard/features/dashboard/views/add_product.dart';
import 'package:fruits_dashboard/features/dashboard/views/dashboard_view.dart';

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
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
  }
}
