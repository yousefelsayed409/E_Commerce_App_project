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

  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
 //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
 
  void Login() async {
    emit(AuthLoginLoadingState());
    try {
      http.Response response = await http.post(
          Uri.parse('https://student.valuxapps.com/api/login'),
          body: {'email': signInEmail.text, "password": signInPassword.text});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          debugPrint('User login Success: $data');

          String token = data['data']['token'];
          await CashNetwork.insertTocash(key: 'token', value: token);
          await CashNetwork.insertTocash(key: 'password', value: signInPassword.text);
          currenpassword = CashNetwork.getCashData(key: 'password');

          debugPrint('Token: $token');
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
