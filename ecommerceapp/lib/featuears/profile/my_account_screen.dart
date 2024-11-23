import 'package:ecommerceapp/core/utils/app_color.dart';
import 'package:ecommerceapp/featuears/profile/update_data_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/widgets/defult_button.dart';
import '../Layout/Layout_cubit.dart/cubit/layout_cubit.dart';
import '../Layout/Layout_cubit.dart/cubit/layout_state.dart';
import 'change_password_screen.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<LayoutCubit>(context);
        final theme = Theme.of(context); // الحصول على الثيم الحالي
        
        if (cubit.userModel == null) cubit.getUserData();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: theme.appBarTheme.backgroundColor ?? AppColors.Teal, // استخدام لون الثيم
            title: Text(
              "My Account",
              style: theme.textTheme.headlineMedium!.copyWith(
                color: theme.colorScheme.onSecondary, // يتغير بناءً على الثيم
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          body: cubit.userModel != null
              ? Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  width: double.infinity,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(cubit.userModel!.image!),
                          radius: 45,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          cubit.userModel!.name!,
                          style: theme.textTheme.headlineMedium,),
                        const SizedBox(height: 10),
                        Text(
                          cubit.userModel!.email!,
                          style: theme.textTheme.bodyLarge, 
                        ), 
                         Text(
  cubit.userModel!.id?.toString() ?? 'Unknown ID', 
  style: theme.textTheme.bodyLarge,
),
                        const SizedBox(height: 30),
                        DefaultButton(
                          text: "Change Password",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChangePasswordScreen()),
                            );
                          },
                        ),
                        const SizedBox(height: 15),
                        DefaultButton(
                          text: "Update Data",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateDataScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
              : const Center(
                  child: CupertinoActivityIndicator(),
                ),
        );
      },
    );
  }
}
