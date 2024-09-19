import 'package:ecommerceapp/core/helper/Shared/Local_NetWork.dart';
import 'package:ecommerceapp/core/utils/app_color.dart';
import 'package:ecommerceapp/core/widgets/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_styles.dart';
import '../../../core/utils/constants.dart';
import '../../../core/routes/app_routes.dart';
import '../signIn/sign_in_screen.dart';
import 'components/sign_up_form.dart';
import 'manger/manger/auth_cubit.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const SignInScreen();
              }));
            },
            icon: const Icon(Icons.arrow_back, color: AppColors.basic)),
        title: Text(
          "Sign Up",
          style: AppStyles.textStyle23,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: BlocConsumer<AuthSignUpCubit, AuthState>(
              listener: (context, state) {
                // TODO: implement listener
                if (state is RegisterSuccessState) { 
                  CashNetwork.insertTocash(key: AppConst.creatAccount, value: AppConst.creatAccount);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()));
                } else if (state is RegisterFaliureState) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Text(
                              state.errorMessage,
                              style: const TextStyle(color: AppColors.white),
                            ),
                            backgroundColor: AppColors.blue,
                          ));
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      const Text("Register Account", style: headingStyle),
                      const SizedBox(height: 10),
                      const Text(
                        "Complete your details or continue \nwith social media",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20.h),
                      const SignUpForm(),
                      SizedBox(height: 20.h),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
