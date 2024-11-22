// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_login_cubit.dart';

@immutable
abstract class AuthLoginState {}

class AuthLoginInitial extends AuthLoginState {}

class AuthLoginLoadingState extends AuthLoginState {}

class AuthLoginSuccessState extends AuthLoginState {
  final UserModel ? userModel;

  AuthLoginSuccessState({ this.userModel});
}

class AuthLoginFailureState extends AuthLoginState {
 final String errorMessage;
  AuthLoginFailureState({
    required this.errorMessage,
  });
}
