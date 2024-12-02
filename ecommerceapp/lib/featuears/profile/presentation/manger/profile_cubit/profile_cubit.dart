import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/core/helper/Shared/Local_NetWork.dart';
import 'package:ecommerceapp/featuears/profile/data/model/User_Models.dart';
import 'package:ecommerceapp/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial()); 
 
  
   // get user profile request //

 UserModel? userModel;
  Future<void> getUserData() async {
    emit(GetUserDataLoadingState());
    Response response = await http.get(
        Uri.parse("https://student.valuxapps.com/api/profile"),
        headers: {'Authorization': CashNetwork.getCashData(key: 'token'), "lang": "en"});
    var responseData = jsonDecode(response.body);
    if (responseData['status'] == true) {
      await CashNetwork.insertTocash(
          key: 'token', value: responseData['data']['token']);
     
      userModel = UserModel.fromJson(data: responseData['data']);
      // debugPrint("response is : $responseData");
      emit(GetUserDataSuccessState());
    } else {
      // print("response is : $responseData");
      emit(FailedToGetUserDataState(error: responseData['message']));
    }
  } 


 // change password request //
  void changePassword(
      {required String userCurrentPassword,
      required String newPassword}) async {
    emit(ChangePasswordLoadingState());
    Response response = await http.post(
        Uri.parse("https://student.valuxapps.com/api/change-password"),
        headers: {
          'lang': 'en',
          'Authorization': CashNetwork.getCashData(key: 'token')
        },
        body: {
          'current_password': userCurrentPassword,
          'new_password': newPassword,
        });
    var responseDecoded = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (responseDecoded['status'] == true) {
        await CashNetwork.insertTocash(key: 'password', value: newPassword);
        currenpassword = CashNetwork.getCashData(key: "password");
        emit(ChangePasswordSuccessState());
      } else {
        emit(ChangePasswordWithFailureState(responseDecoded['message']));
      }
    } else {
      emit(ChangePasswordWithFailureState(
          "something went wrong, try again later"));
    }
  }
    
  // update profile request // 

   void updateUserData(
      {required String name,
      required String phone,
      required String email}) async {
    emit(UpdateUserDataLoadingState());
    try {
      Response response = await http.put(
          Uri.parse("https://student.valuxapps.com/api/update-profile"),
          headers: {'lang': 'en', 'Authorization': CashNetwork.getCashData(key: 'token')},
          body: {'name': name, 'email': email, 'phone': phone});
      var responseBody = jsonDecode(response.body);
      if (responseBody['status'] == true) {
        await getUserData();
        emit(UpdateUserDataSuccessState());
      } else {
        emit(UpdateUserDataWithFailureState(responseBody['message']));
      }
    } catch (e) {
      emit(UpdateUserDataWithFailureState(e.toString()));
    }
  } 

   
   // logout request // 

   Future<void> logOut() async {
  try {
    emit(LogOutLoadingState());

    var response = await http.post(
      Uri.parse("https://student.valuxapps.com/api/logout"),
      headers: {
        'lang': 'ar',
        'Authorization': CashNetwork.getCashData(key: 'token')
      },
      body: {'fcm_token': CashNetwork.getCashData(key: 'token')},
    );

    if (response.statusCode == 200) {
     

      emit(LogOutSuccessState());
    } else {
      emit(LogOutFailureState(errorMessage: "Failed to log out"));
    }
  } catch (e) {
    emit(LogOutFailureState(errorMessage: e.toString()));
  }
}
}
