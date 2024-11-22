import 'package:ecommerceapp/core/utils/app_color.dart';
import 'package:ecommerceapp/core/utils/app_styles.dart';
import 'package:ecommerceapp/core/widgets/custom_nav.dart';
import 'package:ecommerceapp/core/widgets/snakbar_widget.dart';
import 'package:ecommerceapp/featuears/Layout/Layout_cubit.dart/cubit/layout_cubit.dart';
import 'package:ecommerceapp/featuears/Layout/Layout_cubit.dart/cubit/layout_state.dart';
import 'package:ecommerceapp/featuears/auth/signIn/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowDialogWidget extends StatelessWidget {
  const ShowDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LayoutCubit>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Logout',
          style: AppStyles.textStyle20,

        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Are sou sure you want  to log in ?',
          textAlign: TextAlign.center,
          
          // maxLines: 3,
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(5),
                    // side: const BorderSide(width: 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                 CustomNavigation.navigateBack(context);
                },
                child: Text(
                  'Cancel',
                  style: AppStyles.textStyle16.copyWith(color: AppColors.black),

                ),
              ),
            ), 
            const Spacer(),
            BlocConsumer<LayoutCubit, LayoutStates>(
              listener: (context, state) {
                if (state is LogOutSuccessState) {
                  showsnakbarwidget(context, 'LogOut Successfully', true);
                  CustomNavigation.navigateAndFinish(context, const SignInScreen());
                }
                if (state is LogOutFailureState) {
                  showsnakbarwidget(context, state.errorMessage, true);
                }
              },
              builder: (context, state) {
                return Expanded(
                  child: OutlinedButton(
                    // ignore: sort_child_properties_last
                    child: Text(
                      'Logout',
                      style:
AppStyles.textStyle16.copyWith(color: AppColors.red),
                    ),
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(5),
                        // side: const BorderSide(width: 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      await cubit.logOut();
                    },
                  ),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
