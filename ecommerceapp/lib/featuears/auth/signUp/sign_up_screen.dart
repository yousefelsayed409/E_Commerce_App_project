import 'package:ecommerceapp/core/helper/Shared/Local_NetWork.dart';
import 'package:ecommerceapp/core/utils/app_color.dart';
import 'package:ecommerceapp/core/widgets/api_constants.dart';
import 'package:ecommerceapp/core/widgets/custom_loading_indicator.dart';
import 'package:ecommerceapp/core/widgets/defult_button.dart';
import 'package:ecommerceapp/core/widgets/no_acount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/constants.dart';
import '../signIn/sign_in_screen.dart';
import 'components/sign_up_form.dart';
import 'manger/manger/auth_cubit.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthSignUpCubit>();

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: BlocConsumer<AuthSignUpCubit, AuthState>(
              listener: (context, state) {
                // TODO: implement listener
                if (state is RegisterSuccessState) {
                  CashNetwork.insertTocash(
                      key: AppConst.creatAccount, value: AppConst.creatAccount);
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
                      SizedBox(height: 10.h),
                    state is RegisterLoadingState ? const CustomLoadingWidget():  DefaultButton(
                        text:  "Register",
                        press: () {
                          if (cubit.signUpFormKey.currentState!.validate()) {
                            // _formKey.currentState!.save();
                            // if all are valid then go to success screen
                            BlocProvider.of<AuthSignUpCubit>(context)
                                .register();
                            // Navigator.pushNamed(context, AppRoute.signInScreen);
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
    );
  }
}
