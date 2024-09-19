import 'package:ecommerceapp/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppStyles.textStyle16,
        ),
        Text(
          value,
          style: AppStyles.textStyle16,
        )
      ],
    );
  }
}
