import 'package:app_diseno2/animation/categoria_animado.dart';
import 'package:app_diseno2/animation/subtipoHsPrecio_Animado.dart';
import 'package:app_diseno2/animation/tab_Bar_animation.dart';
import 'package:flutter/material.dart';

class CotegoriaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final String imagen = ModalRoute.of(context)!.settings.arguments as String;
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        body: Stack(children: [
          _HeroImagen(imagen: imagen, size: size),
          _AppBar(
            size: size,
          ),
          _BodyContainer(
            size: size,
            hsFin: '22:00',
            hsInicio: '10.00',
            origen1: 'American',
            origen2: 'Italian',
            precioMin: '20',
            categoria: 'Sweety bar',
          ),
        ]),
      ),
    );
  }
}

class _BodyContainer extends StatelessWidget {
  const _BodyContainer({
    Key? key,
    required this.size,
    required this.categoria,
    required this.precioMin,
    required this.origen1,
    required this.origen2,
    required this.hsInicio,
    required this.hsFin,
  }) : super(key: key);

  final Size size;
  final String categoria;
  final String precioMin;
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
        height: size.height * 0.7,
        child: Column(
          children: [
            CategoriaAnimado(categoria: categoria),
            SubTipoHsPrecioAnimado(
                hsFin: hsFin,
                hsInicio: hsInicio,
                origen1: origen1,
                origen2: origen2,
                precioMin: precioMin),
            TabControllerAnimado(),           
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
            size: 55,
          )),
      actions: [
        Container(
            child: IconButton(
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
