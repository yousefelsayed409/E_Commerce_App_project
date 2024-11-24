import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/core/helper/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/app/app.dart';
import 'core/helper/Shared/Local_NetWork.dart';
import 'core/helper/Shared/blocobserver.dart';

//  yousef500@gmail.com
//  123456

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelperPayment.init();
  Bloc.observer = MyBlocObserver();
  await CashNetwork.CashInitialization();
  runApp(const App());
}

