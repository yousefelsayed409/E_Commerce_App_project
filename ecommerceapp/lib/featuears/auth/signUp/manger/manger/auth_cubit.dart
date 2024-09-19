import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'auth_state.dart';

class AuthSignUpCubit extends Cubit<AuthState> {
  AuthSignUpCubit() : super(AuthInitial());
  void Register(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    emit(RegisterLoadingState());
    http.Response response = await http
        .post(Uri.parse('https://student.valuxapps.com/api/register'), body: {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
    });
    var responseBody = jsonDecode(response.body);
    {
      if (responseBody['status'] == true) {
        emit(RegisterSuccessState());
      } else {
        emit(RegisterFaliureState(errorMessage: responseBody["message"]));
      }
    }
  }
}
