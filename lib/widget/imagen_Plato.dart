import 'package:flutter/material.dart';

class Imagen extends StatelessWidget {
  final String imagen;
  final double spreadRadius;
  final double blurRadius;
  final Animation<double>? rotacion;
  final double? widthContainer;
  final double? heigthContainer;
  final double opacidad;

  const Imagen(
      {Key? key,
      required this.imagen,
      required this.spreadRadius,
      required this.blurRadius,
      this.rotacion,
      this.widthContainer,
      this.heigthContainer,
      required this.opacidad})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: rotacion ?? AlwaysStoppedAnimation(0 / 410),
      child: Container(
          width: widthContainer,
          height: heigthContainer,
          decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(
                color: Colors.black12.withOpacity(opacidad),
                spreadRadius: spreadRadius,
                blurRadius: blurRadius,
                offset: Offset(-3, 2))
          ]),
          child: Image(image: AssetImage(imagen))),
    );
  }
}
