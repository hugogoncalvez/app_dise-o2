import 'package:flutter/material.dart';

class BotonAppBar extends StatelessWidget {
  final IconData icono;
  final VoidCallback? onPressed;

  const BotonAppBar({Key? key, required this.icono, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.height * 0.055,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Color(0xffF7F7FA)),
      child: Stack(alignment: Alignment.center, children: [
        IconButton(
            padding: EdgeInsets.zero,
            onPressed: this.onPressed,
            icon: Icon(this.icono,
                color: Colors.black, size: size.height * 0.0384)),
      ]),
    );
  }
}
