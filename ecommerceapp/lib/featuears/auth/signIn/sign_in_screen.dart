import 'package:ecommerceapp/featuears/auth/signIn/manger/cubit/auth_login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthSignInCubit(),
      child: const Scaffold(
        body: Body(),
      ),
    );
  }
}
