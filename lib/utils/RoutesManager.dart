import 'package:cmb_app/pages/home/HomePage.dart';
import 'package:cmb_app/pages/others/AccueilPage.dart';
import 'package:cmb_app/pages/user/DashboardPage.dart';
import 'package:cmb_app/pages/user/ProfilPage.dart';
import 'package:cmb_app/pages/user/UpdateProfilPage.dart';
import 'package:flutter/material.dart';
import '../pages/connexion/LoginPage.dart';
import '../pages/connexion/RegisterPage.dart';
import '../pages/downloading/AudioDownloadingPage.dart';
import '../pages/downloading/DownloadingPage.dart';
import '../pages/downloading/PDFDownloadingPage.dart';
import '../pages/messaging/ContactsScreenPage.dart';
import '../pages/messaging/MessengerPage.dart';
import '../pages/others/EmissionPage.dart';
import '../pages/downloading/VideoDownloadingPage.dart';
import '../pages/user/NotificationPage.dart';
import '../pages/welcome/BienvenuPage.dart';
import '../pages/welcome/SplashScreen.dart';
import 'Routes.dart';

class RoutesManager {
  static Route? route(RouteSettings r) {
    switch (r.name) {
      case Routes.SplashPageRoutes:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.HomePagePageRoutes:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.BienvenuePageRoutes:
        return MaterialPageRoute(builder: (_) => BienvenuPage());
      case Routes.LoginPageRoutes:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Routes.RegisterPageRoutes:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case Routes.ProfilPageRoutes:
        return MaterialPageRoute(builder: (_) => ProfilPage());
      case Routes.DownloadingPageRoutes:
        return MaterialPageRoute(builder: (_) => DownloadingPage());
      case Routes.EmissionPageRoutes:
        return MaterialPageRoute(builder: (_) => EmissionPage());
      case Routes.MessengerPageRoutes:
        return MaterialPageRoute(builder: (_) => MessengerPage());
      case Routes.AccueilPageRoutes:
        return MaterialPageRoute(builder: (_) => AccueilPage());
      case Routes.DashboardPageRoutes:
        return MaterialPageRoute(builder: (_) => DashboardPage());
      case Routes.NotificationPageRoutes:
        return MaterialPageRoute(builder: (_) => NotificationPage());
      case Routes.VideoDownloadingPageRoutes:
        return MaterialPageRoute(builder: (_) => VideoDownloadingPage());
      case Routes.AudioDownloadingPageRoutes:
        return MaterialPageRoute(builder: (_) => AudioDownloadingPage());
      case Routes.PDFDownloadingPageRoutes:
        return MaterialPageRoute(builder: (_) => PDFDownloadingPage());
      case Routes.UpdateProfilPageRoutes:
        return MaterialPageRoute(builder: (_) => UpdateProfilPage());
      case Routes.ContactsScreenPageRoutes:
        return MaterialPageRoute(builder: (_) => ContactsScreenPage());
    }
  }
}