import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/core/function/upload_image_to_api.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'auth_state.dart';

class AuthSignUpCubit extends Cubit<AuthState> {
  AuthSignUpCubit() : super(AuthInitial()); 

//Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();
 //Sign up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();

void uploadProfilePic(XFile? image) {
  if (image != null) {
    profilePic = image;
    emit(UpLoadImageState());
  } else {
    emit(RegisterFaliureState(errorMessage: "يرجى اختيار صورة شخصية"));
  }
}

  void register() async {
  if (profilePic == null) {
    emit(RegisterFaliureState(errorMessage: "يرجى اختيار صورة شخصية"));
    return;
  }
      
  emit(RegisterLoadingState());
  try {
    final imageUrl = await uploadImageToAPI(profilePic!);
    final response = await http.post(
      Uri.parse('https://student.valuxapps.com/api/register'),
      body: {
        "name": signUpName.text,
        "email": signUpEmail.text,
        "phone": signUpPhoneNumber.text,
        "password": signUpPassword.text,
        "image": '',
      },
    );

    final responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      emit(RegisterSuccessState());
    } else {
      emit(RegisterFaliureState(errorMessage: responseBody["message"]));
    }
  } catch (e) {
    emit(RegisterFaliureState(errorMessage: "حدث خطأ أثناء الاتصال بالخادم"));
  }
}

}
