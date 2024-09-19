import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/constants.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key? key,
    required this.IIcon,
    this.numOfitem = 0,
    required this.press,
  }) : super(key: key);

  final IconData IIcon;
  final int numOfitem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100.h),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
              padding: EdgeInsets.all((12.h)),
              height: (46.h),
              width: (46.w),
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(IIcon)),
          if (numOfitem != 0)
            Positioned(
              top: -3.h,
              right: 0,
              child: Container(
                height: (16.h),
                width: (16.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5.w, color: Colors.white),
                ),
                child: Center(
                  child: Text("$numOfitem",
                      style: AppStyles.textStyle10
                          .copyWith(color: AppColors.white)),
                ),
              ),
            )
        ],
      ),
    );
  }
}
