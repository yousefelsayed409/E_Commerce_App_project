import 'package:ecommerceapp/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppStyles.textStyle20,
        ),
        const Spacer(),
        Text(
          value,
          textAlign: TextAlign.center,
        style: AppStyles.textStyle20,
        )
      ],
    );
  }
}
