part of 'app_theme_bloc.dart';

@immutable
sealed class AppThemeState {}

class AppThemeInitial extends AppThemeState {}
 class AppChangeThemeState extends AppThemeState {
  final String? appTheme;
  AppChangeThemeState({ this.appTheme});
}
