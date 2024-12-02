import 'package:ecommerceapp/core/helper/Shared/Local_NetWork.dart';
import 'package:ecommerceapp/core/utils/app_color.dart';
import 'package:ecommerceapp/core/utils/constants.dart';
import 'package:ecommerceapp/core/widgets/api_constants.dart';
import 'package:ecommerceapp/core/widgets/custom_loading_indicator.dart';
import 'package:ecommerceapp/core/widgets/defult_button.dart';
import 'package:ecommerceapp/core/widgets/no_acount.dart';
import 'package:ecommerceapp/featuears/auth/signIn/sign_in_screen.dart';
import 'package:ecommerceapp/featuears/auth/signUp/components/sign_up_form.dart';
import 'package:ecommerceapp/featuears/auth/signUp/manger/manger/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthSignUpCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: BlocConsumer<AuthSignUpCubit, AuthState>(
                listener: (context, state) {
                  if (state is RegisterSuccessState) {
                    CashNetwork.insertTocash(
                        key: AppConst.creatAccount,
                        value: AppConst.creatAccount);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    );
                  } else if (state is RegisterFaliureState) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Text(
                          state.errorMessage,
                          style: const TextStyle(color: AppColors.white),
                        ),
                        backgroundColor: AppColors.blue,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  final cubit = context.read<AuthSignUpCubit>();
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
                        SizedBox(height: 10.h),
                        state is RegisterLoadingState
                            ? const CustomLoadingWidget()
                            : DefaultButton(
                                text: "Register",
                                press: () {
                                  if (cubit.signUpFormKey.currentState!
                                      .validate()) {
                                    cubit.register();
                                  }
                                },
                              ),
                        SizedBox(height: 10.h),
                        const HaveAccountText(to: 'Sign In'),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
