import 'dart:html';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_shop/router/app_router.dart';
import 'package:app_shop/logics/utility/app_bloc_observer.dart';
import 'package:app_shop/resources/views/home/home_screen.dart';

import 'package:app_shop/resources/views/home/blocExample.dart';

Future<void> main(){

  return BlocOverrides.runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs= await SharedPreferences.getInstance();
    runApp(MyApp(
      appRouter: AppRouter(),
      sharedPreferences: prefs,
      connectivity: Connectivity(),
    ));
  },
  blocObserver: AppBlocObserver(),


  );
}



class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;
  final SharedPreferences sharedPreferences;

  const MyApp({Key? key,
    required this.appRouter,
    required this.connectivity,
    required this.sharedPreferences,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'APP DEMO TÂN',

      home:  HomeScreen(),


    );
  }
}