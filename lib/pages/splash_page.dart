import 'package:app_diseno2/widget/circulo.dart';
import 'package:app_diseno2/widget/rotation.dart';
import 'package:app_diseno2/widget/slide.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Color colorCirculo = Color(0xff7F93DF);
    final Color colorCirculo2 = Color(0xff3A40B1);
    return Scaffold(
        floatingActionButton: _FloatingActionButton(),
        backgroundColor: Color(0xff3654D0),
        body: SafeArea(
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            final width = constraints.biggest.width;
            final height = constraints.biggest.height;
            return Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size(width, height),
                  painter: RPSCustomPainter(),
                ),
                CustomPaint(
                  size: Size(width, height),
                  painter: RPSCustomPainter2(),
                ),
                Positioned(
                  top: -height * 0.08,
                  right: -height * 0.11,
                  child: _Imagen(
                    imagen: 'assets/plato.png',
                    spreadRadius: 5,
                    blurRadius: 5,
                  ),
                ),
                Positioned(
                    top: height * 0.38,
                    right: (width <= 410) ? height * 0.216 : height * 0.115,
                    child: Circulo(radio: 9, colore: colorCirculo)),
                Positioned(
                    top: height * 0.45,
                    left: -width * 0.035,
                    child: Circulo(radio: 16, colore: colorCirculo)),
                Positioned(
                    bottom: height * 0.28,
                    right: -width * 0.015,
                    child: Circulo(radio: 10, colore: colorCirculo2)),
                Positioned(
                  top: height * 0.27,
                  right: width * 0.5,
                  child: Rotation(
                      size: (width <= 410) ? height * 0.05 : height * 0.08,
                      blurRadius: 15,
                      dx: 5,
                      dy: 8,
                      spreadradius: 2,
                      turns: -25,
                      image: 'assets/albahaca.png'),
                ),
                Positioned(
                    top: height * 0.04,
                    right: width * 0.55,
                    child: Rotation(
                        blurRadius: 15,
                        dx: 5,
                        dy: 8,
                        image: 'assets/albahaca.png',
                        size: (width <= 410) ? height * 0.04 : height * 0.06,
                        spreadradius: 3,
                        turns: 40)),
                Positioned(
                  top: height * 0.12,
                  left: -height * 0.03,
                  child: Rotation(
                      blurRadius: 15,
                      dx: 5,
                      dy: 8,
                      image: 'assets/mora.png',
                      size: (width <= 410) ? height * 0.065 : height * 0.15,
                      spreadradius: 3,
                      turns: -19),
                ),
                Positioned(
                    bottom: height * 0.25,
                    left: height * 0.04,
                    child: _Texto(size: size))
              ],
            );
          }),
        ));
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  final size = MediaQuery.of(context).size;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final width = constraints.biggest.width;
      final height = constraints.biggest.height;
      print(width);

      return FloatingActionButton(
        child: Container(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Positioned(
                left: (width <= 410) ? height * 0.01 : height * 0.010,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white30,
                  size: 30,
                ),
              ),
              Positioned(
                  left: (width <= 410) ? height * 0.025 : height * 0.023,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 30,
                  ))
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        backgroundColor: Color(0xffFF6339),
        onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
      );
    });
  }
}

class _Texto extends StatelessWidget {
  const _Texto({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Food ',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              Text(' you love,',
                  style: TextStyle(fontSize: 24, color: Colors.white))
            ],
          ),
          Row(
            children: [
              Text('delivered ',
                  style: TextStyle(fontSize: 24, color: Colors.white)),
              Text(' to you',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Easy delegate the small tasks an devote \ntime to the most important things!',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class _Imagen extends StatelessWidget {
  final String imagen;
  final double spreadRadius;
  final double blurRadius;
  final Animation<double>? rotacion;

  const _Imagen({
    Key? key,
    required this.imagen,
    required this.spreadRadius,
    required this.blurRadius,
    this.rotacion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: rotacion ?? AlwaysStoppedAnimation(0 / 410),
      child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(
                color: Colors.black12.withOpacity(0.2),
                spreadRadius: spreadRadius,
                blurRadius: blurRadius,
                offset: Offset(-3, 2))
          ]),
          child: Image(image: AssetImage(imagen))),
    );
  }
}
