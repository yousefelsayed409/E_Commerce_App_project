import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../../../../core/helper/Shared/Local_NetWork.dart';
import '../../../../../core/models/User_Models.dart';
import '../../../../../core/utils/constants.dart';
part 'auth_login_state.dart';

class AuthSignInCubit extends Cubit<AuthLoginState> {
  AuthSignInCubit() : super(AuthLoginInitial());

  void Login({required String email, required String password}) async {
    emit(AuthLoginLoadingState());
    try {
      http.Response response = await http.post(
          Uri.parse('https://student.valuxapps.com/api/login'),
          body: {'email': email, "password": password});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          debugPrint(' user login Success $data');
          await CashNetwork.insertTocash(
              key: 'token', value: data['data']['token']);
          await CashNetwork.insertTocash(key: 'password', value: password);
          currenpassword = await CashNetwork.getCashData(key: 'password');
          emit(AuthLoginSuccessState());
        } else {
          debugPrint(' Failed To Login ${data['message']}');
          emit(AuthLoginFailureState(errorMessage: data['message']));
        }
      }
    } on Exception catch (e) {
      emit(AuthLoginFailureState(errorMessage: e.toString()));
    }
  }
}
