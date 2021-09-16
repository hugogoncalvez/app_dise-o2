import 'package:app_diseno2/widget/auth_background.dart';
import 'package:app_diseno2/widget/card_container.dart';
import 'package:app_diseno2/widget/input_decorations.dart';
import 'package:app_diseno2/widget/textForms.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class RegisterPage extends StatelessWidget {
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
                    Text(
                      'Registro',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Container(
                      child: _Formulario(formKey: _formKey),
                    )
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.06),
              TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, 'login'),
                child: Text(
                  'Ya tiene una cuenta?',
                  style: TextStyle(
                      fontSize: size.height * 0.025,
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
    final Size size = MediaQuery.of(context).size;
    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextformUsuario(),
            TextformCorreo(),
            TextformPass(),
            SizedBox(
                height: (size.height < 800)
                    ? size.height * 0.002
                    : size.height * 0.017),
            MaterialButton(
              minWidth: size.height * 0.35,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Color(0xffFF6339),
              child: Container(
                child: Text(
                  'Registrarse',
                  style: TextStyle(
                      color: Colors.white, fontSize: size.height * 0.025),
                ),
                padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
              ),
            )
          ],
        ));
  }
}
