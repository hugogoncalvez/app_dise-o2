import 'package:app_diseno2/animation/categoria_animado.dart';
import 'package:app_diseno2/animation/categoriaSubtipoHsPrecio_Animado.dart';
import 'package:app_diseno2/animation/categoriaTab_Bar_animation.dart';
import 'package:app_diseno2/bloc/platos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CotegoriaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: BlocBuilder<PlatosBloc, PlatosState>(
        builder: (_, state) {
          return Scaffold(
              body: Stack(children: [
            _HeroImagen(
                imagen: state.categoriaSeleccionada.imagenCategoria as String,
                size: size),
            _AppBar(
              size: size,
            ),
            _BodyContainer(
              size: size,
              state: state,
            )
          ]));
        },
      ),
    );
  }
}

class _BodyContainer extends StatelessWidget {
  const _BodyContainer({
    Key? key,
    required this.size,
    required this.state,
  }) : super(key: key);

  final Size size;

  final PlatosState state;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.white),
        width: size.width,
        height: size.height * 0.78,
        child: Column(
          children: [
            CategoriaAnimado(
              state: state,
            ),
            SubTipoHsPrecioAnimado(
              state: state,
            ),
            TabControllerAnimado(
              state: state,
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroImagen extends StatelessWidget {
  const _HeroImagen({
    Key? key,
    required this.imagen,
    required this.size,
  }) : super(key: key);

  final String imagen;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imagen,
      child: Container(
        width: double.infinity,
        height: size.height * 0.35,
        child: Image(
          image: AssetImage(imagen),
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: _ButtonAppBar(
          icono: Icon(Icons.keyboard_arrow_left_rounded,
              size: size.height * 0.075),
          onPressed: () {
            Navigator.pop(context);
          }),
      actions: [
        _Actions(
          size: size,
          icono: Icons.search,
        ),
        SizedBox(width: 2),
        _Actions(
          size: size,
          icono: Icons.tune,
        ),
        SizedBox(
          width: 15,
        )
      ],
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions({
    Key? key,
    required this.size,
    required this.icono,
  }) : super(key: key);

  final Size size;
  final IconData icono;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: _ButtonAppBar(
            icono: Icon(icono, color: Colors.black, size: size.height * 0.0384),
            onPressed: () {}),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xffF7F7FA)));
  }
}

class _ButtonAppBar extends StatelessWidget {
  const _ButtonAppBar({
    Key? key,
    required this.icono,
    required this.onPressed,
  }) : super(key: key);

  final Icon icono;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: icono);
  }
}
