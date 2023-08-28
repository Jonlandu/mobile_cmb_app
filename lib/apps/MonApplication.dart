import 'package:flutter/material.dart';
import 'package:alice/alice.dart';
import '../controllers/AuthentificationCtrl.dart';
import '../controllers/UserCtrl.dart';
import '../utils/RoutesManager.dart';
import 'package:provider/provider.dart';
import '../utils/Routes.dart';
import 'package:get_storage/get_storage.dart';

Alice alice = Alice(showNotification: true,);

class MonApplication extends StatelessWidget {

  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthentificationCtrl(stockage: box)),
        ChangeNotifierProvider(create: (_) => UserCtrl(stockage: box)),
      ],
      child: MaterialApp(
        navigatorKey: alice.getNavigatorKey(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManager.route,
        initialRoute: Routes.SplashPageRoutes,
      ),
    );
  }
}
