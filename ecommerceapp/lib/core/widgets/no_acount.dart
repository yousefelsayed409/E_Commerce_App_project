import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../featuears/auth/signUp/sign_up_screen.dart';
import '../utils/app_styles.dart';

class NoAccountText extends StatelessWidget {
  final String To;
  final String title;
  const NoAccountText({
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
          onTap: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const SignUpScreen();
          })),
          child: Text(
            To,
            style: AppStyles.textStyle20,
          ),
        ),
      ],
    );
  }
}
