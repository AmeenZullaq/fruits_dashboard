import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_dashboard/core/helper_function/showing_snack_bar.dart';
import 'package:fruits_dashboard/core/services/app_validators.dart';
import 'package:fruits_dashboard/core/widgets/app_button.dart';
import 'package:fruits_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruits_dashboard/features/dashboard/presentation/views/widgets/image_field.dart';
import 'package:fruits_dashboard/features/dashboard/presentation/views/widgets/is_featured_check_box.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late num price;
  bool isFeatired = false;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add product'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                children: [
                  CustomTextFormField(
                    autovalidateMode: autovalidateMode,
                    onSaved: (value) {
                      name = value!;
                    },
                    validator: (value) {
                      return AppValidators.validateUserName(
                        value,
                        'product name is required',
                      );
                    },
                    hintText: 'Product Name',
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextFormField(
                    autovalidateMode: autovalidateMode,
                    onSaved: (value) {
                      code = value!.toLowerCase();
                    },
                    validator: (value) {
                      return AppValidators.validateUserName(
                        value,
                        'product code is required',
                      );
                    },
                    hintText: 'Product Code',
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextFormField(
                    autovalidateMode: autovalidateMode,
                    onSaved: (value) {
                      price = num.parse(value!);
                    },
                    validator: (value) {
                      return AppValidators.validateUserName(
                        value,
                        'product price is required',
                      );
                    },
                    hintText: 'Product Price',
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextFormField(
                    autovalidateMode: autovalidateMode,
                    onSaved: (value) {
                      description = value!;
                    },
                    validator: (value) {
                      return AppValidators.validateUserName(
                        value,
                        'product description is required',
                      );
                    },
                    hintText: 'Product Description',
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  IsFeaturedCheckBox(
                    onChange: (value) {
                      isFeatired = value;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ImageField(
                    onFileChanged: (image) {
                      selectedImage = image;
                    },
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  AppButton(
                    text: 'Add Product',
                    onTap: () {
                      if (selectedImage != null) {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      } else {
                        showingSnackBar(context, text: 'image is required');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
