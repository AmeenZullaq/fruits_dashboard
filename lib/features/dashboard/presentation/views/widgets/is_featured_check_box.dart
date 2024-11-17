import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/utils/app__text_styles.dart';
import 'package:fruits_dashboard/core/widgets/custom_check_box.dart';

class IsFeaturedCheckBox extends StatelessWidget {
  const IsFeaturedCheckBox({super.key, required this.onChange});

  final ValueChanged onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Is faetured product',
              style: AppTextStyles.regular16,
            ),
            CustomCheckBox(
              onChange: (value) {
                onChange(value);
              },
            ),
          ],
        ),
      ],
    );
  }
}
