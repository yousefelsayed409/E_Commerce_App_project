part of 'app_theme_bloc.dart';

@immutable
sealed class AppThemeEvent {}
class InithalAppThemeEvent extends AppThemeEvent {}
class LightThemeEvent extends AppThemeEvent {}
class DarkThemeEvent extends AppThemeEvent {}