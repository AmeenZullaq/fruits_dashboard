import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_dashboard/core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.keyboardType,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.contentPadding,
    this.fillColor,
    this.prefixIcon,
    this.widthBorderSide,
    this.focusNode,
    this.maxLines = 1,
    this.onSaved,
    this.autovalidateMode,
  });
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final Widget? prefixIcon;
  final double? widthBorderSide;
  final FocusNode? focusNode;
  final int? maxLines;
  final void Function(String?)? onSaved;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      onSaved: onSaved,
      focusNode: focusNode,
      obscureText: obscureText!,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      cursorColor: AppColors.gray400,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: getBorder(),
        focusedBorder: getBorder(),
        disabledBorder: getBorder(),
        errorBorder: getBorder(errColor: Colors.red),
        focusedErrorBorder: getBorder(errColor: Colors.red),
        fillColor: fillColor ?? const Color(0xffF9FAFA),
        filled: true,
        hintText: hintText,
        contentPadding: contentPadding ??
            EdgeInsetsDirectional.only(
              bottom: 16.h,
              top: 16.h,
              start: 16.w,
              end: 32.w,
            ),
        hintStyle: AppTextStyles.bold13.copyWith(
          color: AppColors.gray400,
        ),
        prefixIconConstraints: BoxConstraints(
          minHeight: 20.h,
          minWidth: 20.w,
        ),
        suffixIconConstraints: BoxConstraints(
          minHeight: 20.h,
          minWidth: 20.w,
        ),
      ),
    );
  }

  OutlineInputBorder getBorder({Color? errColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        width: widthBorderSide ?? 1,
        color: errColor ?? const Color(0xffE6E9EA),
      ),
    );
  }
}
