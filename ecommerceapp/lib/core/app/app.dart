import 'package:ecommerceapp/core/theme/cubit/them_cubit.dart';
import 'package:ecommerceapp/core/theme/enums/them_enum.dart';
import 'package:ecommerceapp/featuears/Layout/Layout_cubit.dart/cubit/layout_cubit.dart';
import 'package:ecommerceapp/featuears/auth/signIn/manger/cubit/auth_login_cubit.dart';
import 'package:ecommerceapp/featuears/auth/signUp/manger/manger/auth_cubit.dart';
import 'package:ecommerceapp/featuears/cart/manger/paypal_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthSignInCubit(),
        ),
        BlocProvider(
          create: (context) => AuthSignUpCubit(),
        ),
        BlocProvider(
          create: (context) => PaymentCubit()..getAuthToken(),
        ),
        BlocProvider(
          create: (context) => ThemCubit()..changeTheme(ThemeEnumState.Initial),
        ),
        BlocProvider(
          create: (context) => LayoutCubit()
            ..getProducts()
            ..getCarts()
            ..getfavorite()
            ..getBannersData()
            ..getCategoriesData(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<ThemCubit, ThemState>(
            builder: (context, state) {
              final theme = state is AppLightThem
                  ? state.themeData
                  : state is AppDarkThem
                      ? state.themeData
                      : ThemeData.light();

              return MaterialApp(
                theme: theme,
                debugShowCheckedModeBanner: false,
                initialRoute: AppRoute.splashScreen,
                onGenerateRoute: AppRoute.generateRoute,
              );
            },
          );
        },
      ),
    );
  }
}
