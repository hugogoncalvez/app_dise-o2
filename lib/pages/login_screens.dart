import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:app_diseno2/widget/auth_background.dart';
import 'package:app_diseno2/widget/card_container.dart';
import 'package:app_diseno2/widget/textForms.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff3654D0),
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.28),
              CardContainer(
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.014),
                    Text('Bienvenido',
                        style: Theme.of(context).textTheme.headline4),
                    Container(
                      child: _Formulario(formKey: _formKey),
                    )
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.07),
              TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, 'register'),
                child: Text(
                  'Crear una nueva Cuenta',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                      Colors.indigo.withOpacity(0.1),
                    ),
                    shape: MaterialStateProperty.all(StadiumBorder())),
              ),
              SizedBox(height: size.height * 0.07),
            ],
          ),
        ),
      ),
    );
  }
}

class _Formulario extends StatelessWidget {
  const _Formulario({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextformCorreo(),
            TextformPass(),
            SizedBox(height: 40),
            MaterialButton(
              minWidth: 300,
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'home');
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Color(0xffFF6339),
              child: Container(
                child: Text(
                  'Ingresar',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            )
          ],
        ));
  }
}
