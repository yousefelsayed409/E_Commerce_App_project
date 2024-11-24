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
    final themeCubit = BlocProvider.of<ThemCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'اختيار الثيم',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.white, 
          ),
        ),
        backgroundColor: isDarkMode ? Colors.black : AppColors.Teal,   
        centerTitle: true,
      ),
      body: BlocBuilder<ThemCubit, ThemState>(
        builder: (context, state) {
          isDarkMode = state is AppDarkThem; 
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isDarkMode ? Icons.nights_stay : Icons.wb_sunny,
                size: 100,
                color: isDarkMode ? Colors.yellow : Colors.blue,
              ),
              const SizedBox(height: 20),
              Text(
                isDarkMode ? 'الوضع الداكن' : 'الوضع الفاتح',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.yellow : Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              SwitchListTile(
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                  themeCubit.changeTheme(
                    value ? ThemeEnumState.Dark : ThemeEnumState.Light,
                  );
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
          );
        },
      ),
    );
  }
}
