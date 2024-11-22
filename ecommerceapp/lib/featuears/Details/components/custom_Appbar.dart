import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  // final double rating;

  // CustomAppBar({required this.rating});

  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    SizedBox(
      height: 30.h,
    );
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
        child: Row(
          children: [
            SizedBox(
              height: (40.h),
              width: (50.w),
              child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: kPrimaryColor, shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 5.h),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Text(
                    "4.5",
                    style:
                        AppStyles.textStyle16.copyWith(color: AppColors.white),
                  ),
                  SizedBox(width: 5.w),
                  // SvgPicture.asset("assets/icons/Star Icon.svg"),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
