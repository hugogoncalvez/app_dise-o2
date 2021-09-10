import 'package:app_diseno2/pages/carrito.dart';
import 'package:flutter/material.dart';
import 'package:app_diseno2/pages/categorias_page.dart';
import 'package:app_diseno2/pages/home_page.dart';
import 'package:app_diseno2/pages/login_screens.dart';
import 'package:app_diseno2/pages/register_screens.dart';
import 'package:app_diseno2/pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curso Diseño',
      initialRoute: 'inicio',
      routes: {
        'inicio': (_) => SplashPage(),
        'login': (_) => LoginScreen(),
        'register': (_) => RegisterPage(),
        'home': (_) => HomePage(),
        'categoria': (_) => CotegoriaPage(),
        'carrito': (_)  => CarritoPage()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
