import 'package:flutter/material.dart';


class Rotation extends StatelessWidget {
  const Rotation({
    Key? key,
    required this.size,
    required this.spreadradius,
    required this.blurRadius,
    required this.dx,
    required this.dy,
    required this.turns,
    required this.image,
  }) : super(key: key);

  final double size;
  final double spreadradius;
  final double blurRadius;
  final double dx;
  final double dy;
  final double turns;
  final String image;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(turns / 360),
      child: Container(
          width: size,
          decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(
                color: Colors.black12.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 15,
                offset: Offset(5, 8) // changes position of shadow
                )
          ]),
          child: Image(image: AssetImage(image))),
    );
  }
}

