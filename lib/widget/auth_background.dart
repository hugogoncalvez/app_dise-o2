import 'package:app_diseno2/widget/circulo.dart';
import 'package:app_diseno2/widget/rotation.dart';
import 'package:app_diseno2/widget/slide.dart';
import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  //
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Color colorCirculo = Color(0xff7F93DF);
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
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
            top: (size.width <= 410)
                ? -size.height * 0.11
                : -size.height * 0.08, //-size.height * 0.06,
            right:
                (size.width <= 410) ? -size.height * 0.11 : -size.height * 0.09,
            child: Image(
              image: AssetImage('assets/plato.png'),
              // fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
              top: size.height * 0.45,
              right: -size.height * 0.039,
              child: Circulo(radio: 30, colore: colorCirculo)),
          Positioned(
              top: size.height * 0.1,
              left: size.height * 0.1,
              child: Circulo(radio: 12, colore: colorCirculo)),
          Positioned(
              bottom: size.height * 0.03,
              right: size.height * 0.0124,
              child: Circulo(radio: 9, colore: colorCirculo)),
          Positioned(
            bottom: size.height * 0.12,
            left: size.height * 0.005,
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
              bottom: size.height * 0.05,
              right: size.height * 0.27,
              child: Rotation(
                  blurRadius: 15,
                  dx: 5,
                  dy: 8,
                  image: 'assets/albahaca.png',
                  size: size.height * 0.04,
                  spreadradius: 3,
                  turns: 120)),
          Positioned(
              top: size.height * 0.45,
              left: -size.height * 0.019,
              child: Rotation(
                  blurRadius: 15,
                  dx: 5,
                  dy: 8,
                  image: 'assets/albahaca.png',
                  size: size.height * 0.07,
                  spreadradius: 3,
                  turns: 120)),
          Positioned(
              bottom: size.height * 0.15,
              right: size.height * 0.019,
              child: Rotation(
                  blurRadius: 15,
                  dx: 5,
                  dy: 8,
                  image: 'assets/burger.png',
                  size: size.height * 0.07,
                  spreadradius: 3,
                  turns: 0)),
          this.child,
        ],
      ),
    );
  }
}
