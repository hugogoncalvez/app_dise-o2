import 'package:app_diseno2/widget/input_decorations.dart';
import 'package:flutter/material.dart';

class TextformPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _passController = new TextEditingController();
    return TextFormField(
      // se estable en value todo lo que tenga el pass y se lo pasa al provider
      obscureText: true,
      autocorrect: false,
      keyboardType: TextInputType.text,
      decoration: InputDecorations.loginInputDecoration(
          labelText: 'Contraseña', prefixIcon: Icons.lock),
      validator: (value) {
        return (value != null && value.length >= 6)
            ? null
            : 'La contraseña debe tener más de 6 caracteres';
      },
      controller: _passController,
    );
  }
}

class TextformUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _usuarioController = new TextEditingController();
    return TextFormField(
      // se estable en value todo lo que tenga el pass y se lo pasa al provider

      autocorrect: false,
      keyboardType: TextInputType.text,
      decoration: InputDecorations.loginInputDecoration(
          labelText: 'Usuario', prefixIcon: Icons.person),
      validator: (value) {
        return (value != null && value.length < 1)
            ? null
            : 'Debe escribir un nombre de usuario';
      },
      controller: _usuarioController,
    );
  }
}

class TextformCorreo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _correoController = new TextEditingController();

    return TextFormField(
      // se estable en value todo lo que tenga el email y se lo pasa al provider
      // autofocus: true,
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecorations.loginInputDecoration(
        labelText: 'Correo electrónico',
        prefixIcon: Icons.alternate_email,
      ),
      validator: (value) {
        String pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regExp = new RegExp(pattern);
        return regExp.hasMatch(value ?? '')
            ? null
            : 'Ingrese una derección de correo válida';
      },
      controller: _correoController,
    );
  }
}
