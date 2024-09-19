import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/Form_Error.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/defult_button.dart';
import '../../../../core/widgets/no_acount.dart';
import '../../../../core/widgets/socal_card.dart';
import '../../otp/otp_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            children: [
              SizedBox(height: 35.h),
              Text("Forgot Password", style: AppStyles.textStyle28),
              SizedBox(height: 20.h),
              const Text(
                "Please enter your email and we will send \nyou a link to return to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25.h),
              const ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({super.key});

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String? email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty && !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
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
              focusedBorder: outlineInputBorder(),
            ),
          ),
          const SizedBox(height: (20)),
          FormError(errors: errors),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocalCard(
                imageAseetss: Image.asset('assets/Icons/google.png'),
                press: () {},
              ),
              SocalCard(
                imageAseetss: Image.asset('assets/Icons/facebook.png'),
                press: () {},
              ),
              SocalCard(
                imageAseetss: Image.asset('assets/Icons/twitter (1).png'),
                press: () {},
              ),
            ],
          ),
          const SizedBox(height: 20),
          DefaultButton(
            text: "Continue",
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return OtpScreen();
              }));
              if (_formKey.currentState!.validate()) {
                // Do what you want to do
                // Navigator.pushNamed(context, AppRoute.otpScreen);
              }
            },
          ),
          SizedBox(height: 15.h),
          const NoAccountText(To: ' Sign In'),
        ],
      ),
    );
  }
}
