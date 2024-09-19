import 'package:flutter/material.dart';

import '../../../core/utils/app_styles.dart';
import 'components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const SizedBox(),
        centerTitle: true,
        title: Text(
          "Login Success",
          style: AppStyles.textStyle23,
        ),
      ),
      body: const Body(),
    );
  }
}
