import 'package:ecommerceapp/featuears/Layout/widget/home_nav_bar.dart';
import 'package:ecommerceapp/featuears/profile/change_password_screen.dart';
import 'package:ecommerceapp/featuears/profile/setting_view.dart';
import 'package:ecommerceapp/featuears/profile/update_data_screen.dart';
import 'package:flutter/material.dart';
import '../../featuears/Details/Detail_screen.dart';
import '../../featuears/Favorite/favorite_screen.dart';
import '../../featuears/auth/otp/otp_screen.dart';
import '../../featuears/cart/Cart_screen.dart';
import '../../featuears/home/screen/Home_screen.dart';
import '../../featuears/profile/profile_screen.dart';
import '../../featuears/auth/forgot_password/forgot_password_screen.dart';
import '../../featuears/auth/login_success/login_success_screen.dart';
import '../../featuears/auth/signIn/sign_in_screen.dart';
import '../../featuears/auth/signUp/sign_up_screen.dart';
import '../../featuears/on_boarding/onboarding_screen.dart';
import '../../featuears/splash/splash_screen.dart';
import '../models/product_model.dart';

class AppRoute {
  static const signInScreen = 'SignInScreen';
  static const profileScreen = 'ProfileScreen';
  static const splashScreen = 'SplashScreen';
  static const signUpScreen = 'SignUpScreen';
  static const homescreen = 'HomeScreen';
  static const onBoardingScreen = 'OnBoardingScreen';
  static const favoriteScreen = 'FavoriteScreen';
  static const categoryScreen = 'CategoryScreen';
  static const cartScreen = 'CartScreen';
  static const forgetPassWordScreen = 'ForgotPasswordScreen';
  static const layoutScreen = 'HomeNavBarWidget3';
  static const otpScreen = 'OtpScreen';
  static const updateDataScreen = 'UpdateDataScreen';
  static const changePasswordScreen = 'ChangePasswordScreen';
  static const darkAndLightView = 'DarkAndLightView';

  static const loginSuccess = 'LoginSuccessScreen';
  static const detailsScreen = 'DetailsScreen';

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return SizeTransition3( Splashscreen());
      case onBoardingScreen:
        return SizeTransition5(const OnBoardingScreen());
      case signUpScreen:
        return SizeTransition5(const SignUpScreen());
      case signInScreen:
        return SizeTransition5(const SignInScreen());

      case profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case darkAndLightView:
        return MaterialPageRoute(
            builder: (_) => DarkAndLightView());
      case forgetPassWordScreen:
        return SizeTransition5(const ForgotPasswordScreen());
      case loginSuccess:
        return SizeTransition5(const LoginSuccessScreen());
      case homescreen:
        return SizeTransition5(const HomeScreen());
      case otpScreen:
        return SizeTransition3(OtpScreen());
      case profileScreen:
        return SizeTransition5(const ProfileScreen());
      case favoriteScreen:
        return SizeTransition5(const FavoriteScreen());
      case cartScreen:
        return SizeTransition5(const CartScreen());
      case changePasswordScreen:
        return SizeTransition5(ChangePasswordScreen());
      case updateDataScreen:
        return SizeTransition5(UpdateDataScreen());

      //todo__________
      case layoutScreen:
        return MaterialPageRoute(
            builder: (_) => const HomeNavBarWidget3());

      case detailsScreen:
        final ppprouduct = settings.arguments as ProductModel;

        return SizeTransition5(DetailsScreen(
          ppprouduct: ppprouduct,
        ));
    }
    return undefinedRoute();
  }

  static Route undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text('noRouteFound'),
            ),
          )),
    );
  }
}

class SizeTransition3 extends PageRouteBuilder {
  final Widget page;

  SizeTransition3(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(seconds: 4),
          reverseTransitionDuration: const Duration(seconds: 2),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return Align(
              alignment: Alignment.center,
              child: SizeTransition(
                axis: Axis.horizontal,
                sizeFactor: animation,
                child: page,
                axisAlignment: 0,
              ),
            );
          },
        );
}

class SizeTransition5 extends PageRouteBuilder {
  final Widget page;

  SizeTransition5(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(seconds: 2),
          // reverseTransitionDuration:const  Duration(seconds: 2),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return Align(
              alignment: Alignment.centerRight,
              child: SizeTransition(
                axis: Axis.horizontal,
                sizeFactor: animation,
                child: page,
                axisAlignment: 0,
              ),
            );
          },
        );
}
