import 'package:ecommerceapp/core/theme/cubit/them_cubit.dart';
import 'package:ecommerceapp/core/theme/enums/themstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DarkAndLightView extends StatefulWidget {
  @override
  _DarkAndLightViewState createState() => _DarkAndLightViewState();
}

class _DarkAndLightViewState extends State<DarkAndLightView> {
  ThemeState? _selectedTheme;

  @override
  Widget build(BuildContext context) {
    final mode = BlocProvider.of<ThemCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('اختيار الثيم'),
      ),
      body: Center(
        child: DropdownButton<ThemeState>(
          value: _selectedTheme,
          hint: const Text('اختر الثيم'),
          items: const [
            DropdownMenuItem(
              value: ThemeState.Dark,
              child: Text('DarkMod'),
            ),
            DropdownMenuItem(
              value: ThemeState.Light,
              child: Text('LightMod'),
            ),
          ],
          onChanged: (ThemeState? newValue) {
            setState(() {
              _selectedTheme = newValue;
            });
            if (newValue != null) {
              mode.ChangeThem(newValue);
            }
          },
        ),
      ),
    );
  }
}
