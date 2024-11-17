import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_dashboard/core/helper_function/pick_image.dart';
import 'package:fruits_dashboard/core/utils/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFileChanged});

  final Function(File? image) onFileChanged;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  File? pickedImage;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: InkWell(
        onTap: () async {
          isLoading = true;
          pickedImage = await pickImage();
          widget.onFileChanged(pickedImage);
          isLoading = false;
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.gray200),
              ),
              child: pickedImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Image.file(pickedImage!),
                    )
                  : Icon(
                      Icons.image_outlined,
                      size: 180.sp,
                    ),
            ),
            Visibility(
              visible: pickedImage != null,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    pickedImage = null;
                  });
                },
                icon: const Icon(
                  Icons.delete,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
