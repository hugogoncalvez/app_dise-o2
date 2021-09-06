import 'package:flutter/material.dart';

class Circulo extends StatelessWidget {
  final double radio;
  final Color colore;

  const Circulo({required this.radio, required this.colore});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radio * 2,
      height: radio * 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radio),
          color: colore
          ),
    );
  }
}
