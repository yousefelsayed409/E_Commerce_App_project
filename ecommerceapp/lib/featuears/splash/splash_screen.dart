import 'package:ecommerceapp/core/helper/Shared/Local_NetWork.dart';
import 'package:ecommerceapp/core/helper/Shared/cash_helper.dart';
import 'package:ecommerceapp/core/utils/app_styles.dart';
import 'package:ecommerceapp/core/widgets/api_constants.dart';
import 'package:ecommerceapp/core/widgets/custom_nav.dart';
import 'package:ecommerceapp/featuears/on_boarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/routes/app_routes.dart';
import '../../core/utils/app_assets.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    navigateToOnBoardingViewOrHomeView();
  }

  void navigateToOnBoardingViewOrHomeView() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      CustomNavigation.navigateTo(context, const OnBoardingScreen());
      // // التحقق من إذا ما كان المستخدم قد شاهد شاشة الـ Onboarding أم لا
      // bool? hasSeenOnboarding = CashNetwork.getCashData(key: AppConst.onBoardingScreen) as bool?;
      // if (hasSeenOnboarding ?? false) {
      //   Navigator.pushReplacementNamed(context, AppRoute.layoutScreen);
      // } else {
      //   Navigator.pushReplacementNamed(context, AppRoute.onBoardingScreen);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.infinity.w,
          height: double.infinity.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.splashImage),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 5.h),
              Text("Shop App", style: AppStyles.pacifico400style60),
            ],
          ),
        ),
      ),
    );
  }
}
