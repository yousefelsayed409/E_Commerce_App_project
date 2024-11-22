import 'package:ecommerceapp/core/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../featuears/auth/signUp/sign_up_screen.dart';
import '../utils/app_styles.dart';

class DontHaveAccountText extends StatelessWidget {
  final String To;
  final String title;
  const DontHaveAccountText({
    Key? key,
    this.title = 'Don’t have an account ?',
    required this.To,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppStyles.textStyle16,
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamedAndRemoveUntil(
              context, AppRoute.signUpScreen, (route) => false),
          child: Text(
            To,
             style: AppStyles.textStyle20,
          ),
        ),
      ],
    );
  }
}




class HaveAccountText extends StatelessWidget {
  final String To;
  final String title;
  const HaveAccountText({
    Key? key,
    this.title = ' Have an acount  ?  ',
    required this.To,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
style: AppStyles.textStyle16,        ),
        GestureDetector(
          onTap: () => Navigator.pushNamedAndRemoveUntil(
              context, AppRoute.signInScreen, (route) => false),
          child: Text(
            To,
             style: AppStyles.textStyle20,
          ),
        ),
      ],
    );
  }
}
