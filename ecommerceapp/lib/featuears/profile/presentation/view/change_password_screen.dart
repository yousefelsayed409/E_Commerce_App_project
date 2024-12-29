import 'package:ecommerceapp/core/localization/localization.dart';
import 'package:ecommerceapp/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/custom_form_field.dart';
import '../../../../core/widgets/defult_button.dart';
import '../../../../core/widgets/snakbar_widget.dart';
import '../manger/profile_cubit/profile_cubit.dart';

// ignore: must_be_immutable
class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  TextEditingController newpasswordtrollar = TextEditingController();
  TextEditingController oldpasswordcontrollar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProfileCubit>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title:  Text("Change Password".tr(context), style: TextStyle(color: AppColors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 32, right: 32.0),
        child: Column(
          children: [
            buildFormField(
                controller: oldpasswordcontrollar,
                label: 'old password'.tr(context),
                hitt: ' Your old password'.tr(context)),
            SizedBox(
              height: 15.h,
            ),
            buildFormField(
                controller: newpasswordtrollar,
                label: 'new password'.tr(context),
                hitt: ' Your password '.tr(context)),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              height: 15.h,
            ), 
            
            BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                if (state is ChangePasswordSuccessState) {
                  showsnakbarwidget(
                          context,
                          'Success Change Passsword',
                          true);
                          Navigator.pop(context);
                  
                }
                // TODO: implement listener
              
              },
              builder: (context, state) {
                return DefaultButton(
                  text: state is ChangePasswordLoadingState
                      ? 'Loading..'.tr(context)
                      : 'Update'.tr(context),
                  press: () {
                    if (oldpasswordcontrollar.text.trim() == currenpassword) {
                      if (newpasswordtrollar.text.length >= 6) {
                        cubit.changePassword(
                            userCurrentPassword: currenpassword!,
                            newPassword: newpasswordtrollar.text.trim());
                      }
                      // else {
                      //   showsnakbarwidget(context,
                      //       'Password must be at least 6 charactres', false);
                      // }
                    } else {
                      showsnakbarwidget(
                          context,
                          'Please, Chek Your Old Password And Try Again',
                          false);
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
