import 'package:ecommerceapp/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class onBoardingContent extends StatelessWidget {
  const onBoardingContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Text("Shop App", style: AppStyles.textStyle36),
        SizedBox(
          height: 10.h,
        ),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 2),
        Image.asset(
          image!,
          height: 260.h,
          width: 230.w,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
