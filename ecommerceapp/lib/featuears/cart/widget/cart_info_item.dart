import 'package:ecommerceapp/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/Shared/Local_NetWork.dart';

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
          style: TextStyle(
            fontSize: 20.sp,
                                            color:  CashNetwork.getCashData(key: 'theme') == 'light'
                                ? Colors.black
                                : Colors.white,
                                          ),
        ),
        const Spacer(),
        Text(
          value,
          textAlign: TextAlign.center,
 style: TextStyle(
            fontSize: 20.sp,
                                            color:  CashNetwork.getCashData(key: 'theme') == 'light'
                                ? Colors.black
                                : Colors.white,
                                          ),        )
      ],
    );
  }
}
