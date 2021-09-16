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
              hsFin: state.categoriaSeleccionada.horaFin!,
              hsInicio: state.categoriaSeleccionada.horaInicio!,
              origen1: state.categoriaSeleccionada.paisOrigen1!,
              origen2: state.categoriaSeleccionada.paisOrigen2!,
              compraMin: state.categoriaSeleccionada.compraMin!,
              categoria: state.categoriaSeleccionada.categoria!,
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
    required this.categoria,
    required this.compraMin,
    required this.origen1,
    required this.origen2,
    required this.hsInicio,
    required this.hsFin,
  }) : super(key: key);

  final Size size;
  final String categoria;
  final String compraMin;
  final String origen1;
  final String origen2;
  final String hsInicio;
  final String hsFin;

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
            CategoriaAnimado(categoria: categoria),
            SubTipoHsPrecioAnimado(
                hsFin: hsFin,
                hsInicio: hsInicio,
                origen1: origen1,
                origen2: origen2,
                compraMin: compraMin),
            TabControllerAnimado(
              categoria: categoria,
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
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left_rounded,
            size: size.height * 0.075,
          )),
      actions: [
        Container(
            child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(Icons.search,
                    color: Colors.black, size: size.height * 0.0384)),
            width: size.height * 0.055,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Color(0xffF7F7FA))),
        SizedBox(width: 2),
        Container(
          width: size.height * 0.055,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Color(0xffF7F7FA)),
          child: Stack(alignment: Alignment.center, children: [
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(Icons.tune,
                    color: Colors.black, size: size.height * 0.0384)),
          ]),
        ),
        SizedBox(
          width: 15,
        )
      ],
    );
  }
}
