import 'package:ecommerceapp/core/helper/Shared/Local_NetWork.dart';
import 'package:ecommerceapp/core/widgets/api_constants.dart';
import 'package:ecommerceapp/featuears/Layout/Layout_cubit.dart/cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/no_acount.dart';
import '../../../../core/widgets/socal_card.dart';
import '../../login_success/login_success_screen.dart';
import '../manger/cubit/auth_login_cubit.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthSignInCubit, AuthLoginState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AuthLoginSuccessState) {
          CashNetwork.insertTocash(key: AppConst.token, value: state.userModel!.token!);
          context.read<LayoutCubit>().getUserData();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginSuccessScreen()));
        }
        if (state is AuthLoginFailureState) {
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
        return SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: (20.h)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 7),
                      Text("Welcome Back ! ", style: AppStyles.textStyle28),
                      SizedBox(height: 12.h),
                      const Text(
                        "Sign in with your email and password  \nor continue with social media",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 35.h),
                      const SignForm(),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocalCard(
                            imageAseetss:
                                Image.asset('assets/Icons/google.png'),
                            press: () {},
                          ),
                          SocalCard(
                            imageAseetss:
                                Image.asset('assets/Icons/facebook.png'),
                            press: () {},
                          ),
                          SocalCard(
                            imageAseetss:
                                Image.asset('assets/Icons/twitter (1).png'),
                            press: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      const NoAccountText(To: ' SignUp'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
