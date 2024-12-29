import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/core/helper/Shared/Local_NetWork.dart';
import 'package:meta/meta.dart';

part 'app_theme_event.dart';
part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc() : super(AppThemeInitial()) {
    on<AppThemeEvent>((event, emit) {
      if (event is InithalAppThemeEvent) {
        String? savedTheme = CashNetwork.getCashData(key: 'theme');
        if (savedTheme != null && savedTheme.isNotEmpty) {
          emit(AppChangeThemeState(appTheme: savedTheme));
        } else {
          emit(AppChangeThemeState(appTheme: 'light'));
        }
      } else if (event is LightThemeEvent) {
        CashNetwork.insertTocash(key: 'theme', value: 'light');
        emit(AppChangeThemeState(appTheme: 'light'));
      } else if (event is DarkThemeEvent) {
        CashNetwork.insertTocash(key: 'theme', value: 'dark');
        emit(AppChangeThemeState(appTheme: 'dark'));
      }
    });
  }
}
