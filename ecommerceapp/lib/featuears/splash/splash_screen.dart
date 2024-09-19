import 'package:ecommerceapp/core/utils/app_styles.dart';
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
    navigateToOnBoardingViewOrHomeView();
    super.initState();
  }

  void navigateToOnBoardingViewOrHomeView() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.pushReplacementNamed(context, AppRoute.onBoardingScreen);
      // if (CacheHelper.getBoolean(key: 'OnBoardingView') ?? false) {
      // return Navigator.pushReplacementNamed(context, AppRoute..homeView);
      // } else {
      //   return Navigator.pushReplacementNamed(context, AppRoute.onBoardingView);
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
          decoration:  const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppAssets.splashImage,
              ),
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


  // child: SizedBox(
            //   width: double.maxFinite,
            //   child: CustomImageView(
            //     imagePath: ImageConstant.imgLogo,
            //     height: 58.v,
            //     width: 121.h,
            //     alignment: Alignment.center,
            //   ),
            // ),