import 'package:ecommerceapp/core/theme/cubit/them_cubit.dart';
import 'package:ecommerceapp/core/theme/enums/themstate.dart';
import 'package:ecommerceapp/featuears/Layout/Layout_cubit.dart/cubit/layout_cubit.dart';
import 'package:ecommerceapp/featuears/auth/signIn/manger/cubit/auth_login_cubit.dart';
import 'package:ecommerceapp/featuears/auth/signUp/manger/manger/auth_cubit.dart';
import 'package:ecommerceapp/featuears/cart/manger/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants.dart';
import '../routes/app_routes.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

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
          create: (context) => ThemCubit()..ChangeThem(ThemeState.Initial),
        ),
        
        BlocProvider(
          create: (context) => LayoutCubit()
            ..getCarts()
            ..getfavorite()
            ..getBannersData()
            ..getCategoriesData()
            ..getProducts(),
        ),
      ],
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
                
                  debugShowCheckedModeBanner: false,  
                  initialRoute: 
                  Token != null
                      ? AppRoute.signInScreen
                      : AppRoute.splashScreen,
                  onGenerateRoute: AppRoute.generateRoute,
                );
          },
        ),
    );
  }
}
