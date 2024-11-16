import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruits_dashboard/features/dashboard/views/widgets/image_field.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
                      hintText: 'Product Name',
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextFormField(
                      hintText: 'Product Code',
                      keyboardType: TextInputType.number,
                      controller: TextEditingController(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextFormField(
                      hintText: 'Product Price',
                      keyboardType: TextInputType.number,
                      controller: TextEditingController(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextFormField(
                      hintText: 'Product Description',
                      keyboardType: TextInputType.text,
                      maxLines: 5,
                      controller: TextEditingController(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ImageField(
                      onFileChanged: (image) {},
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
