// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}
 
 //get user data state //
final class ProfileInitial extends ProfileState {}
class GetUserDataSuccessState extends ProfileState {}

class GetUserDataLoadingState extends ProfileState {}

class FailedToGetUserDataState extends ProfileState {
 final String error;
  FailedToGetUserDataState({required this.error});
}
 
 // change password state // 
class ChangePasswordLoadingState extends ProfileState {}

class ChangePasswordSuccessState extends ProfileState {}

class ChangePasswordWithFailureState extends ProfileState {
 final String error;

  ChangePasswordWithFailureState(this.error);
}
   
   // update profile state // 

   class UpdateUserDataLoadingState extends ProfileState {}

class UpdateUserDataSuccessState extends ProfileState {}

class UpdateUserDataWithFailureState extends ProfileState {
 final String error;

  UpdateUserDataWithFailureState(
    this.error,
  );
}
 

  // logout state // 

  class LogOutLoadingState extends ProfileState {}

class LogOutSuccessState extends ProfileState {}

class LogOutFailureState extends ProfileState {
  final String errorMessage;
  LogOutFailureState({
    required this.errorMessage,
  });
}