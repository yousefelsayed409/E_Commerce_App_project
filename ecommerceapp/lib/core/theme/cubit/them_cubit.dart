import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/core/helper/Shared/cash_helper.dart';
import 'package:flutter/material.dart';

import '../enums/themstate.dart';

part 'them_state.dart';

class ThemCubit extends Cubit<ThemState> {
  ThemCubit() : super(ThemInitial()); 

  // ignore: non_constant_identifier_names
  ChangeThem(ThemeState state) {
    switch (state) {
      case ThemeState.Initial:
        // ignore: unnecessary_null_comparison
        if (CacheHelper().getData(key: ('theme')) != null) {
          if (CacheHelper().getData(key: 'theme') == 'l') {
            emit(AppLightThem());
          } else {
            emit(AppDarkThem());
          }
        }

        break;
      case ThemeState.Light:
        CacheHelper().saveData(key: 'theme', value: 'l');
        emit(AppLightThem());

        break;
      case ThemeState.Dark:
        CacheHelper().saveData(key: 'theme', value: 'd');
        emit(AppDarkThem());

        break;
      default:
    }
  }
}
