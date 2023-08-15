import 'package:flutter/material.dart';
import '../pages/connexion/LoginPage.dart';
import '../pages/welcome/BienvenuPage.dart';
import '../pages/welcome/SplashScreen.dart';
import 'Routes.dart';

class RoutesManager {
  static Route? route(RouteSettings r) {
    switch (r.name) {
      case Routes.SplashPageRoutes:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.BienvenuePageRoutes:
        return MaterialPageRoute(builder: (_) => BienvenuPage());
      case Routes.LoginPageRoutes:
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}