import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/defult_button.dart';
import '../../../../core/routes/app_routes.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 25.h),
        Image.asset("assets/images/success.png", height: 250.h),
        SizedBox(height: 60.h),
        Text("Login Success", style: AppStyles.textStyle30),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.h),
          child: SizedBox(
            width: double.infinity,
            child: DefaultButton(
              text: "Back to home",
              press: () {
                //////////////////////!
                Navigator.pushNamed(context, AppRoute.layoutScreen);
              },
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
