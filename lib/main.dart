import 'package:app_diseno2/pages/login_screens.dart';
import 'package:app_diseno2/pages/register_screens.dart';
import 'package:app_diseno2/pages/slide_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curso Diseño',
      initialRoute: 'inicio',
      routes: {'inicio': (_) => SlidePage(),
      'login': (_)=> LoginScreen(),
      'register': (_)=> RegisterPage(),},
      debugShowCheckedModeBanner: false,
    );
  }
}
