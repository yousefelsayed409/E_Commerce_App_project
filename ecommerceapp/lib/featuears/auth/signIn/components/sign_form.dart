import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/Form_Error.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/defult_button.dart';
import '../../../../core/widgets/keyboar_Util.dart';
import '../../forgot_password/forgot_password_screen.dart';
import '../manger/cubit/auth_login_cubit.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  bool? remember = false;
  // final emailcontrollar = TextEditingController();
  // final passwordcontrollar = TextEditingController();

  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthSignInCubit>();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(controller: cubit.signInEmail),
          SizedBox(height: 30.h),
          buildPasswordFormField(controller: cubit.signInPassword),
          SizedBox(height: 30.h),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              const Text("Remember me"),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return ForgotPasswordScreen();
                })),
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: 20.h),
          DefaultButton(
            text: State is AuthLoginSuccessState ? 'Loading' : "Login",
            press: () {
              if (_formKey.currentState!.validate() == true) {
                // _formKey.currentState!.save();
                KeyboardUtil.hideKeyboard(context);
                BlocProvider.of<AuthSignInCubit>(context).Login();
                // if all are valid then go to success screen

                // Navigator.pushNamed(context, AppRoute.homescreen);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField(
      {required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      // onSaved: (newValue) => password = newValue,
      // onChanged: (value) {
      //   if (value.isNotEmpty) {
      //     removeError(error: kPassNullError);
      //   } else if (value.length >= 8) {
      //     removeError(error: kShortPassError);
      //   }
      //   return null;
      // },
      validator: (value) {
        if (controller.text.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (controller.text.length < 4) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
        enabledBorder: outlineInputBorder(),
        // border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(30),
        //     borderSide: const BorderSide(
        //       color: Colors.black,
        //     )),
        focusedBorder: outlineInputBorder(),
      ),
    );
  }

  TextFormField buildEmailFormField({
    required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      // onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (controller.text.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value!)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),

        enabledBorder: outlineInputBorder(),
        // OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(30),
        //     borderSide: const BorderSide(
        //       color: Colors.black,
        //     )),
        // border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(30),
        //     borderSide: const BorderSide(
        //       color: Colors.black,
        //     )),
        focusedBorder: outlineInputBorder(),
        //  OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(30),
        //     borderSide: const BorderSide(width: 1.5, color: Colors.grey)),
      ),
    );
  }
}
