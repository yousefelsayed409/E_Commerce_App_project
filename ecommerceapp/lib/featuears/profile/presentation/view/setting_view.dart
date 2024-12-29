import 'package:ecommerceapp/core/helper/Shared/Local_NetWork.dart';
import 'package:ecommerceapp/core/localization/bloc/app_language_bloc.dart';
import 'package:ecommerceapp/core/localization/localization.dart';
import 'package:ecommerceapp/core/theme/bloc/app_theme_bloc.dart';
import 'package:ecommerceapp/core/theme/cubit/them_cubit.dart';
import 'package:ecommerceapp/core/theme/enums/them_enum.dart';
import 'package:ecommerceapp/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DarkAndLightView extends StatefulWidget {
  @override
  _DarkAndLightViewState createState() => _DarkAndLightViewState();
}

class _DarkAndLightViewState extends State<DarkAndLightView> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<AppThemeBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'choese theme'.tr(context),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: CashNetwork.getCashData(key: 'theme') == 'light'
                  ? Colors.white
                  : Colors.white,
            ),
          ),
          backgroundColor: CashNetwork.getCashData(key: 'theme') == 'light'
              ? AppColors.Teal
              : Colors.black,
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              CashNetwork.getCashData(key: 'theme') == 'light'
                  ? Icons.wb_sunny
                  : Icons.nights_stay,
              size: 100,
              color: CashNetwork.getCashData(key: 'theme') == 'light'
                  ? Colors.yellow
                  : Colors.blue,
            ),
            const SizedBox(height: 20),
            Text(
              CashNetwork.getCashData(key: 'theme') == 'light'
                  ? ' light Theme'.tr(context)
                  : ' Dark Theme'.tr(context),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: CashNetwork.getCashData(key: 'theme') == 'light'
                    ? Colors.yellow
                    : Colors.blue,
              ),
            ),
            const SizedBox(height: 20),

           ElevatedButton(
              onPressed: () {
                BlocProvider.of<AppLanguageBloc>(context)
                    .add(ArabicLanguageEvent());
              },
              child: Text(
                  AppLocalizations.of(context)?.translate('arabic_button') ??
                      'اللغة العربية' , 
                      style: TextStyle(color: CashNetwork.getCashData(key: 'theme') == 'light' ? Colors.black : Colors.white),
                      ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<AppLanguageBloc>(context)
                    .add(EnglishLanguageEvent());
              },
              child: Text(
                  AppLocalizations.of(context)?.translate('english_button') ??
                      'English' , 
                      style: TextStyle(color: CashNetwork.getCashData(key: 'theme') == 'light' ? Colors.black : Colors.white),
                      ),
            ),
            SwitchListTile(
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });

                if (value) {
                  BlocProvider.of<AppThemeBloc>(context).add(DarkThemeEvent());
                } else {
                  BlocProvider.of<AppThemeBloc>(context).add(LightThemeEvent());
                }
              },
              title: const Text(
                'تبديل الثيم',
                style: TextStyle(fontSize: 18),
              ),
              secondary: Icon(
                isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: isDarkMode ? Colors.yellow : Colors.blue,
              ),
            ),
          ],
        ));
  }
}
