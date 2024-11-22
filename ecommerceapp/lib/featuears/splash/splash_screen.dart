import 'package:ecommerceapp/core/utils/constants.dart';
import 'package:ecommerceapp/core/widgets/api_constants.dart';
import 'package:ecommerceapp/featuears/Layout/widget/home_nav_bar.dart';
import 'package:ecommerceapp/featuears/auth/signIn/sign_in_screen.dart';
import 'package:ecommerceapp/featuears/on_boarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/helper/Shared/Local_NetWork.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_styles.dart';
import '../../core/widgets/custom_nav.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }
   
  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 1200));

    final String? token = CashNetwork.getCashData(key: 'token');
    currenpassword = CashNetwork.getCashData(key: 'password');

bool hasSeenOnboarding = (CashNetwork.getCashData(key: AppConst.onBoardingScreen) == AppConst.onBoardingScreen);

    if (token != null && token.isNotEmpty) {
  debugPrint("______________User token is: $token");
  debugPrint("______________User password is: ${currenpassword ?? 'null'}");
      CustomNavigation.navigateTo(context, const HomeNavBarWidget3() );
    } else if (hasSeenOnboarding == true) {
      CustomNavigation.navigateTo(context, const SignInScreen());
    } else {
      CustomNavigation.navigateTo(context, const OnBoardingScreen());
    }
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
