import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_dashboard/core/utils/app_routes.dart';
import 'package:fruits_dashboard/core/widgets/app_button.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              text: 'Add Data',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.addProductView);
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            AppButton(
              text: 'Get Orders',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.ordersView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
