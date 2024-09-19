import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/core/helper/Shared/cash_helper.dart';
import 'package:ecommerceapp/core/helper/dio.dart';
import 'package:flutter/material.dart';
import 'core/app/app.dart';
import 'core/helper/Shared/Local_NetWork.dart';
import 'core/helper/Shared/blocobserver.dart';
import 'core/utils/constants.dart';

//  yousefelsayed50@gmail.com
//  123456
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  await DioHelperPayment.init();
  Bloc.observer = MyBlocObserver();
  await CashNetwork.CashInitialization();
  Token =  CashNetwork.getCashData(key: 'token');
  currenpassword =  CashNetwork.getCashData(key: 'password');
  debugPrint("User token is : $Token");
  debugPrint("User password is : $currenpassword");
  runApp(const App());
}
