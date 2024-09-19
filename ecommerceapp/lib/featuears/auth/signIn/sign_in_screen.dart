import 'package:flutter/material.dart';

import '../../../core/utils/app_styles.dart';
import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static const String id = "SignInScreen";

  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Sign In",
          style: AppStyles.textStyle23,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}
