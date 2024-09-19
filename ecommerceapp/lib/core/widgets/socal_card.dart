import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocalCard extends StatelessWidget {
  const SocalCard({
    Key? key,
    required this.imageAseetss,
    this.press,
  }) : super(key: key);

  final Image imageAseetss;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: (10.h)),
        padding: EdgeInsets.all((12.h)),
        height: (50.h),
        width: (50.w),
        decoration: const BoxDecoration(
          
          shape: BoxShape.circle,
        ),
        child: imageAseetss,
      ),
    );
  }
}
