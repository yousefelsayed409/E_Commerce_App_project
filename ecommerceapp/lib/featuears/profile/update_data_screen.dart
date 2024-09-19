import 'package:ecommerceapp/featuears/Layout/Layout_cubit.dart/cubit/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/custom_form_field.dart';
import '../../core/widgets/defult_button.dart';
import '../../core/widgets/snakbar_widget.dart';
import '../Layout/Layout_cubit.dart/cubit/layout_cubit.dart';

// ignore: must_be_immutable
class UpdateDataScreen extends StatelessWidget {
  UpdateDataScreen({super.key});

  TextEditingController namecontrollar = TextEditingController();
  TextEditingController emailcontrollar = TextEditingController();
  TextEditingController phonecontrollar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);
    namecontrollar.text = cubit.userModel!.name!;
    emailcontrollar.text = cubit.userModel!.email!;
    phonecontrollar.text = cubit.userModel!.phone!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: const Text("UpDate Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 32, right: 32.0),
        child: Column(
          children: [
            buildFormField(
                controller: namecontrollar,
                label: 'name',
                hitt: 'Enter Your Name'),
            SizedBox(
              height: 15.h,
            ),
            buildFormField(
                controller: emailcontrollar,
                label: 'Email',
                hitt: 'Enter Your Email '),
            SizedBox(
              height: 15.h,
            ),
            buildFormField(
                controller: phonecontrollar,
                label: 'Phone',
                hitt: 'Enter Youe Phone'),
            SizedBox(
              height: 15.h,
            ),
            BlocConsumer<LayoutCubit, LayoutStates>(
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
                      ? 'Loading...'
                      : 'Update',
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

