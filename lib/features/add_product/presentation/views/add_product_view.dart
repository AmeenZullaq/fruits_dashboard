import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_dashboard/core/helper_function/showing_snack_bar.dart';
import 'package:fruits_dashboard/core/services/app_validators.dart';
import 'package:fruits_dashboard/core/widgets/app_button.dart';
import 'package:fruits_dashboard/core/widgets/custom_circle_indicator.dart';
import 'package:fruits_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruits_dashboard/features/add_product/presentation/cubits/add_product_cubit/add_product_cubit.dart';
import 'package:fruits_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruits_dashboard/features/add_product/presentation/views/widgets/is_featured_check_box.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  @override
  Widget build(BuildContext context) {
    AddProductCubit productCubit = context.read<AddProductCubit>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add product'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: productCubit.formKey,
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: BlocListener<AddProductCubit, AddProductState>(
                listener: (context, state) {
                  if (state is AddProductSuccess) {
                    Navigator.pop(context);
                    showingSnackBar(context,
                        text: 'Product added scuccessfully');
                  }
                  if (state is AddProductFailure) {
                    Navigator.pop(context);
                    showingSnackBar(context, text: state.errMessage);
                  }
                  if (state is AddProductLoading) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const CustomCircleIndicator();
                      },
                    );
                  }
                },
                child: Column(
                  children: [
                    CustomTextFormField(
                      autovalidateMode: productCubit.autovalidateMode,
                      onSaved: (value) {
                        productCubit.name = value!;
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
                      autovalidateMode: productCubit.autovalidateMode,
                      onSaved: (value) {
                        productCubit.code = value!.toLowerCase();
                      },
                      validator: (value) {
                        return AppValidators.validateUserName(
                          value,
                          'product code is required',
                        );
                      },
                      hintText: 'Product Code',
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextFormField(
                      autovalidateMode: productCubit.autovalidateMode,
                      onSaved: (value) {
                        productCubit.price = num.parse(value!);
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
                      autovalidateMode: productCubit.autovalidateMode,
                      onSaved: (value) {
                        productCubit.expirationMonths = int.parse(value!);
                      },
                      validator: (value) {
                        return AppValidators.validateUserName(
                          value,
                          'product Expiration Months is required',
                        );
                      },
                      hintText: 'Product Expiration Months',
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextFormField(
                      autovalidateMode: productCubit.autovalidateMode,
                      onSaved: (value) {
                        productCubit.numberOfCalories = int.parse(value!);
                      },
                      validator: (value) {
                        return AppValidators.validateUserName(
                          value,
                          'number Of Calories is required',
                        );
                      },
                      hintText: 'Product number Of Calories',
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextFormField(
                      autovalidateMode: productCubit.autovalidateMode,
                      onSaved: (value) {
                        productCubit.unitWeight = int.parse(value!);
                      },
                      validator: (value) {
                        return AppValidators.validateUserName(
                          value,
                          'unit Weight is required',
                        );
                      },
                      hintText: 'Product unit Weight',
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextFormField(
                      autovalidateMode: productCubit.autovalidateMode,
                      onSaved: (value) {
                        productCubit.description = value!;
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
                      text: 'Is faetured product',
                      onChange: (value) {
                        productCubit.isFeatired = value;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    IsFeaturedCheckBox(
                      text: 'Is organic product',
                      onChange: (value) {
                        productCubit.isOrganic = value;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ImageField(
                      onFileChanged: (image) {
                        productCubit.selectedImage = image;
                      },
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    AppButton(
                      text: 'Add Product',
                      onTap: () {
                        if (productCubit.selectedImage != null) {
                          if (productCubit.formKey.currentState!.validate()) {
                            productCubit.formKey.currentState!.save();
                            productCubit.addProduct();
                          } else {
                            productCubit.autovalidateMode =
                                AutovalidateMode.always;
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
      ),
    );
  }
}
