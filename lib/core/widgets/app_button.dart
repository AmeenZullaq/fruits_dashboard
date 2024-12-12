import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_dashboard/core/utils/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.textColor,
    this.buttomColor,
    this.borderSideColor,
  });

  final String text;
  final void Function() onTap;
  final Color? textColor;
  final Color? buttomColor;
  final Color? borderSideColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: buttomColor ?? AppColors.green1_500,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: borderSideColor ?? Colors.transparent,
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.bold16.copyWith(
            color: textColor ?? const Color(0xffFFFFFF),
          ),
        ),
      ),
    );
  }
}
