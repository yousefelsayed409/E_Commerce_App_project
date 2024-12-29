import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/core/helper/Shared/Local_NetWork.dart';
import 'package:ecommerceapp/core/theme/enums/them_enum.dart';
import 'package:flutter/material.dart';

part 'them_state.dart';

class ThemCubit extends Cubit<ThemState> {
  ThemCubit() : super(ThemInitial());

  void changeTheme(ThemeEnumState state) {
    switch (state) {
      case ThemeEnumState.Initial:
        final theme = CashNetwork.getCashData(key: 'theme');
        if (theme == 'l') {
          emit(AppLightThem());
        } else {
          emit(AppDarkThem());
        }
        
              break;
      case ThemeEnumState.Light:
        CashNetwork.insertTocash(key: 'theme', value: 'l');
        emit(AppLightThem());
        break;
      case ThemeEnumState.Dark:
        CashNetwork.insertTocash(key: 'theme', value: 'd');
        emit(AppDarkThem());
        break;
      default:
        break;
    }
  }
}
