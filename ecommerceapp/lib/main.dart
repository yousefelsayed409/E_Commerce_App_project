import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/core/helper/Shared/cash_helper.dart';
import 'package:ecommerceapp/core/helper/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/app/app.dart';
import 'core/helper/Shared/Local_NetWork.dart';
import 'core/helper/Shared/blocobserver.dart';
import 'core/utils/constants.dart';

//  yousef500@gmail.com
//  123456

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  await DioHelperPayment.init();
  Bloc.observer = MyBlocObserver();
  await CashNetwork.CashInitialization();
  debugPrint("User token is: ${Token ?? 'null'}");
  debugPrint("User password is: ${currenpassword ?? 'null'}");
  runApp(const App());
}

