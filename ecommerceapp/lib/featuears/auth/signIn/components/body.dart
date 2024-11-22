import 'package:ecommerceapp/core/widgets/custom_loading_indicator.dart';
import 'package:ecommerceapp/core/widgets/defult_button.dart';
import 'package:ecommerceapp/core/widgets/keyboar_Util.dart';
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
        var cubit = context.read<AuthSignInCubit>();

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
                    state is AuthLoginLoadingState? const CustomLoadingWidget() :   DefaultButton(
                        text:  "Login",
                        press: () {
                          if (cubit.signInFormKey.currentState!.validate() == true) {
                            // _formKey.currentState!.save();
                            KeyboardUtil.hideKeyboard(context);
                            BlocProvider.of<AuthSignInCubit>(context).Login();
                            // if all are valid then go to success screen

                            // Navigator.pushNamed(context, AppRoute.homescreen);
                          }
                        },
                      ),
                      SizedBox(height: 20.h),
                      const SocialCardWidget(),
                      SizedBox(height: 20.h),
                      const DontHaveAccountText(to: ' SignUp'),
                       SizedBox(height: 20.h),
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
