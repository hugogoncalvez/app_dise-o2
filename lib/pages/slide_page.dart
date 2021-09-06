import 'package:app_diseno2/widget/circulo.dart';
import 'package:app_diseno2/widget/rotation.dart';
import 'package:app_diseno2/widget/slide.dart';
import 'package:flutter/material.dart';

class SlidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Color colorCirculo = Color(0xff7F93DF);
    final Color colorCirculo2 = Color(0xff3A50B1);
    return Scaffold(
        floatingActionButton: _FloatingActionButton(),
        backgroundColor: Color(0xff425CCE),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size(size.width, size.height),
                  painter: RPSCustomPainter(),
                ),
                CustomPaint(
                  size: Size(size.width, size.height),
                  painter: RPSCustomPainter2(),
                ),
                Positioned(
                  top: -size.height * 0.05,
                  right: -size.width * 0.35,
                  child: _Imagen(
                    imagen: 'assets/plato.png',
                    spreadRadius: 5,
                    blurRadius: 5,
                  ),
                ),
                Positioned(
                    top: size.height * 0.38,
                    right: size.height * 0.124,
                    child: Circulo(radio: 9, colore: colorCirculo)),
                Positioned(
                    top: size.height * 0.45,
                    left: -size.height * 0.02,
                    child: Circulo(radio: 16, colore: colorCirculo)),
                Positioned(
                    bottom: size.height * 0.3,
                    right: -size.height * 0.008,
                    child: Circulo(radio: 10, colore: colorCirculo2)),
                Positioned(
                  top: size.height * 0.25,
                  right: size.height * 0.25,
                  child: Rotation(
                      size: size.height * 0.05,
                      blurRadius: 15,
                      dx: 5,
                      dy: 8,
                      spreadradius: 2,
                      turns: -25,
                      image: 'assets/albahaca.png'),
                ),
                Positioned(
                    top: size.height * 0.04,
                    right: size.height * 0.27,
                    child: Rotation(
                        blurRadius: 15,
                        dx: 5,
                        dy: 8,
                        image: 'assets/albahaca.png',
                        size: size.height * 0.04,
                        spreadradius: 3,
                        turns: 40)),
                Positioned(
                  top: size.height * 0.12,
                  left: -size.height * 0.005,
                  child: Rotation(
                      blurRadius: 15,
                      dx: 5,
                      dy: 8,
                      image: 'assets/mora.png',
                      size: size.height * 0.065,
                      spreadradius: 3,
                      turns: -19),
                ),
                Positioned(
                    bottom: size.height * 0.25,
                    left: size.height * 0.04,
                    child: _Texto(size: size))
              ],
            ),
          ),
        ));
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FloatingActionButton(
      child: Container(
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned(
              left: size.height * 0.01,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white30,
                size: 30,
              ),
            ),
            Positioned(
                left: size.height * 0.025,
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
      turns: rotacion ?? AlwaysStoppedAnimation(0 / 360),
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
