import 'package:flutter/material.dart';

class CarritoTotalcuentaAnimado extends StatefulWidget {
  @override
  _CarritoTotalcuentaAnimadoState createState() =>
      _CarritoTotalcuentaAnimadoState();
}

class _CarritoTotalcuentaAnimadoState extends State<CarritoTotalcuentaAnimado>
    with SingleTickerProviderStateMixin {
  //
  late AnimationController controller;

  late Animation<double> opacidad;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    opacidad = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // boton Play
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Totalcuenta(),
      builder: (BuildContext context, Widget? child) {
        return Opacity(opacity: opacidad.value, child: child);
      },
    );
  }
}

class _Totalcuenta extends StatelessWidget {
  const _Totalcuenta({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Restaurant bill'), Text('\$28,75')]),
          SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Delivery'), Text('\$5,50')]),
          SizedBox(height: 25),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Total',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('\$34,25',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ])
        ],
      ),
    );
  }
}
