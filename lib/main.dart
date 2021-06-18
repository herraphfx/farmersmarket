

import 'package:farmers_ecommerce2/pages/home.dart';
import 'package:farmers_ecommerce2/pages/login.dart';
import 'package:farmers_ecommerce2/pages/splash.dart';
import 'package:farmers_ecommerce2/provider/app.dart';
import 'package:farmers_ecommerce2/provider/product.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/user_provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: UserProvider.initialize()),
    ChangeNotifierProvider.value(value: ProductProvider.initialize()),
    ChangeNotifierProvider.value(value: AppProvider()),


  ], child: MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.white
    ),
    home: ScreensController(),
  ),));
}


class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch(user.status){
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return Login();
      case Status.Authenticated:
        return HomePage();
      default: return Login();
    }
  }
}


