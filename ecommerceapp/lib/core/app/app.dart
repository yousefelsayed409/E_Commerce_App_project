import 'package:ecommerceapp/core/theme/bloc/app_theme_bloc.dart';
import 'package:ecommerceapp/featuears/Favorite/presentation/manger/favorite_cubit/favorite_cubit.dart';
import 'package:ecommerceapp/featuears/cart/manger/cart_cubit/cart_cubit.dart';
import 'package:ecommerceapp/featuears/cart/manger/paypal_cubit/cubit.dart';
import 'package:ecommerceapp/featuears/home/presentation/manger/home_cubit/home_cubit.dart';
import 'package:ecommerceapp/featuears/on_boarding/onboarding_screen.dart';
import 'package:ecommerceapp/featuears/profile/presentation/manger/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../localization/bloc/app_language_bloc.dart';
import '../localization/localization.dart';
import '../routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..getProducts(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => PaymentCubit()..getAuthToken(),
        ),
        BlocProvider(
          create: (context) => AppThemeBloc()..add(InithalAppThemeEvent()),
        ),
        BlocProvider(
          create: (context) =>
              AppLanguageBloc()..add(InithalAppLanguageEvent()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<AppThemeBloc, AppThemeState>(
            builder: (context, themeState) {
              var themee = themeState is AppChangeThemeState
                  ? themeState.appTheme
                  : 'light';

              return BlocBuilder<AppLanguageBloc, AppLanguageState>(
                builder: (context, appLangState) {
                  String? appLang = 'en';
                  if (appLangState is AppChangeLanguage) {
                    appLang = appLangState.languageCode;
                  }
                  return MaterialApp(
                    home: OnBoardingScreen(),
                    locale: Locale(appLang ?? 'en'),
                    theme: themee == 'light'
                        ? ThemeData.light()
                        : ThemeData.dark(),
                    debugShowCheckedModeBanner: false,
                    themeMode: ThemeMode.light,
                    initialRoute: AppRoute.splashScreen,
                    onGenerateRoute: AppRoute.generateRoute,
                    supportedLocales: const [Locale('en'), Locale('ar')],
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate
                    ],
                    localeResolutionCallback: (deviceLocale, supportedLocales) {
                      if (deviceLocale != null) {
                        for (var locale in supportedLocales) {
                          if (deviceLocale.languageCode ==
                              locale.languageCode) {
                            return locale;
                          }
                        }
                      }
                      return const Locale('en');
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
