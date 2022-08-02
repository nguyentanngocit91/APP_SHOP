import 'package:flutter/material.dart';
import 'package:app_shop/resources/views/home/home_screen.dart';

class AppRouter{

  Route? onGenerateRoute(RouteSettings settings){

    switch(settings.name){
      case '/':
        return MaterialPageRoute(
            builder: (c)=> HomeScreen(),
        );
      default:
        return null;
    }

  }

}

