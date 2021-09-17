import 'package:app_diseno2/bloc/platos_bloc.dart';

import 'package:flutter/material.dart';
import 'package:app_diseno2/pages/payment_page.dart';
import 'package:app_diseno2/pages/carrito.dart';
import 'package:app_diseno2/pages/categorias_page.dart';
import 'package:app_diseno2/pages/home_page.dart';
import 'package:app_diseno2/pages/login_screens.dart';
import 'package:app_diseno2/pages/register_screens.dart';
import 'package:app_diseno2/pages/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => new PlatosBloc())],
      child: MaterialApp(
        title: 'Curso Diseño',
        initialRoute: 'inicio',
        routes: {
          'inicio': (_) => SplashPage(),
          'login': (_) => LoginScreen(),
          'register': (_) => RegisterPage(),
          'home': (_) => HomePage(),
          'categoria': (_) => CotegoriaPage(),
          'carrito': (_) => CarritoPage(),
          'pago': (_) => PagoPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
