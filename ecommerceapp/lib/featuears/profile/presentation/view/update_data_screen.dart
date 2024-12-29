import 'package:ecommerceapp/core/localization/localization.dart';
import 'package:ecommerceapp/core/utils/app_color.dart';
import 'package:ecommerceapp/featuears/profile/presentation/manger/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_form_field.dart';
import '../../../../core/widgets/defult_button.dart';
import '../../../../core/widgets/snakbar_widget.dart';

// ignore: must_be_immutable
class UpdateDataScreen extends StatelessWidget {
  UpdateDataScreen({super.key});

  TextEditingController namecontrollar = TextEditingController();
  TextEditingController emailcontrollar = TextEditingController();
  TextEditingController phonecontrollar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProfileCubit>(context);
    namecontrollar.text = cubit.userModel!.name!;
    emailcontrollar.text = cubit.userModel!.email!;
    phonecontrollar.text = cubit.userModel!.phone!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title:  Text("UpDate Profile".tr(context) ,style: TextStyle(color: AppColors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 32, right: 32.0),
        child: Column(
          children: [
            buildFormField(
                controller: namecontrollar,
                label: 'name'.tr(context),
                hitt: 'Enter Your Name'.tr(context)),
            SizedBox(
              height: 15.h,
            ),
            buildFormField(
                controller: emailcontrollar,
                label: 'Email'.tr(context),
                hitt: 'Enter Your Email '.tr(context)),
            SizedBox(
              height: 15.h,
            ),
            buildFormField(
                controller: phonecontrollar,
                label: 'Phone'.tr(context),
                hitt: 'Enter Youe Phone'.tr(context)),
            SizedBox(
              height: 15.h,
            ),
            BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                // TODO: implement listener
                if (state is UpdateUserDataSuccessState) {
                  showsnakbarwidget(context, 'Data Updated Successfully', true);
                  Navigator.pop(context);
                }
                if (state is UpdateUserDataWithFailureState) {
                  showsnakbarwidget(context, state.error, true);
                }
              },
              builder: (context, state) {
                return DefaultButton(
                  text: state is UpdateUserDataLoadingState
                      ? 'Loading...'.tr(context)
                      : 'Update'.tr(context),
                  press: () {
                    if (namecontrollar.text.isNotEmpty &&
                        emailcontrollar.text.isNotEmpty &&
                        phonecontrollar.text.isNotEmpty) {
                      cubit.updateUserData(
                          name: namecontrollar.text,
                          phone: phonecontrollar.text,
                          email: emailcontrollar.text);
                    } else {
                      showsnakbarwidget(
                          context, 'Please Enter all Data !', false);
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

