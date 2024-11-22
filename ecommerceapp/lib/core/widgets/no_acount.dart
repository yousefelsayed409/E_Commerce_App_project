import 'package:ecommerceapp/core/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/app_styles.dart';

class DontHaveAccountText extends StatelessWidget {
  final String to;
  final String title;
  const DontHaveAccountText({
    super.key,
    this.title = 'Don’t have an account ?',
    required this.to,
  });

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
            to,
             style: AppStyles.textStyle20,
          ),
        ),
      ],
    );
  }
}




class HaveAccountText extends StatelessWidget {
  final String to;
  final String title;
  const HaveAccountText({
    super.key,
    this.title = ' Have an acount  ?  ',
    required this.to,
  });

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
            to,
             style: AppStyles.textStyle20,
          ),
        ),
      ],
    );
  }
}
