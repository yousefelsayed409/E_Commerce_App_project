// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterFaliureState extends AuthState {
 final String errorMessage;
  RegisterFaliureState({
    required this.errorMessage,
  });
}

class UpLoadImageState extends AuthState {}

