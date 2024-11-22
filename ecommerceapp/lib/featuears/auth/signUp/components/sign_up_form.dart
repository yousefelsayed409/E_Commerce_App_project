import 'package:ecommerceapp/featuears/auth/signUp/components/pic_image_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/Form_Error.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/socal_card.dart';
import '../manger/manger/auth_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String? email;
  String? password;
  String? conform_password;
  bool remember = false;

  
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
    var cubit = context.read<AuthSignUpCubit>();
    return Form(
      key: cubit.signUpFormKey,
      child: Column(
        children: [ 
          const PickImageWidget(),
          SizedBox(height: 15.h),
          buildNameFormField(controller: cubit.signUpName),
          SizedBox(height: 15.h),
          buildEmailFormField(controller: cubit.signUpEmail),
          SizedBox(height: 15.h),
          buildPhoneFormField(controller: cubit.signUpPhoneNumber),
          SizedBox(height: 15.h),
          buildPasswordFormField(controller: cubit.signUpPassword),
          SizedBox(height: 15.h),
          FormError(errors: errors),
          SizedBox(height: 10.h),
          const SocialCardWidget()
          
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: kMatchPassError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
      
        floatingLabelBehavior: FloatingLabelBehavior.always,
       
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
      //   password = value;
      // },
      validator: (value) {
        if (controller.text.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (controller.text.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
         
          floatingLabelBehavior: FloatingLabelBehavior.always,
          // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder()),
    );
  }

  TextFormField buildPhoneFormField(
      {required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      obscureText: false,
      // onSaved: (newValue) => password = newValue,
      // onChanged: (value) {
      //   if (value.isNotEmpty) {
      //     removeError(error: kphoneNullError);
      //   } else if (value.length >= 11) {
      //     removeError(error: kphoneNullError);
      //   }
      //   password = value;
      // },
      validator: (value) {
        if (controller.text.isEmpty) {
          addError(error: kphoneNullError);
          return "";
        } else if (controller.text.length < 11) {
          addError(error: kphoneNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "phone",
          hintText: "Enter your phone",
          
          floatingLabelBehavior: FloatingLabelBehavior.always,
          // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder()),
    );
  }

  TextFormField buildNameFormField(
      {required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      obscureText: false,
      // onSaved: (newValue) => password = newValue,
      // onChanged: (value) {
      //   if (value.isNotEmpty) {
      //     removeError(error: knameNullError);
      //   } else if (value.length >= 8) {
      //     removeError(error: knameNullError);
      //   }
      //   password = value;
      // },
      validator: (value) {
        if (controller.text.isEmpty) {
          addError(error: knameNullError);
          return "";
        } else if (controller.text.length < 0) {
          addError(error: knameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Name",
          hintText: "Enter your Name",
        
          floatingLabelBehavior: FloatingLabelBehavior.always,
          // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder()),
    );
  }

  TextFormField buildEmailFormField(
      {required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      // onSaved: (newValue) => email = newValue,
      // onChanged: (value) {
      //   if (value.isNotEmpty) {
      //     removeError(error: kEmailNullError);
      //   } else if (emailValidatorRegExp.hasMatch(value)) {
      //     removeError(error: kInvalidEmailError);
      //   }
      //   return null;
      // },
      validator: (value) {
        if (controller.text.isEmpty) {
          addError(error: kEmailNullError);
          return "";

          /// todo
        } else if (!emailValidatorRegExp.hasMatch(value!)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          
          floatingLabelBehavior: FloatingLabelBehavior.always,
          // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder()),
    );
  }
}
