import 'package:ecommerceapp/core/theme/cubit/them_cubit.dart';
import 'package:ecommerceapp/core/theme/enums/them_enum.dart';
import 'package:ecommerceapp/featuears/Favorite/presentation/manger/favorite_cubit/favorite_cubit.dart';
import 'package:ecommerceapp/featuears/cart/manger/cart_cubit/cart_cubit.dart';
import 'package:ecommerceapp/featuears/home/presentation/manger/home_cubit/home_cubit.dart';
import 'package:ecommerceapp/featuears/profile/presentation/manger/profile_cubit/profile_cubit.dart';
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
          create: (context) => HomeCubit()..getProducts()..getCategories()..getBannersData(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit()..getUserData(),
        ),
        BlocProvider(
         create: (context) => FavoriteCubit()..getfavorite(),
        ),
        BlocProvider(
          create: (context) => CartCubit()..getCarts(),
        ),
      ],
      child:ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocProvider(
            create: (context) => ThemCubit()..changeTheme(ThemeEnumState.Light),
            child: BlocBuilder<ThemCubit, ThemState>(
              builder: (context, state) {
                final theme = state is AppLightThem
                    ? state.themeData
                    : state is AppDarkThem
                        ? state.themeData
                        : ThemeData.light();
      
                return MaterialApp(
                  theme: theme,
                  debugShowCheckedModeBanner: false,
                  themeMode: ThemeMode.light,
                  initialRoute: AppRoute.splashScreen,
                  onGenerateRoute: AppRoute.generateRoute,
                );
              },
            ),
          );
        },
      ),
    );
      
  }
}
