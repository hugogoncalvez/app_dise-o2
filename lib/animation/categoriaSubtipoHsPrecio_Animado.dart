import 'package:flutter/material.dart';

class SubTipoHsPrecioAnimado extends StatefulWidget {
  final String compraMin;
  final String origen1;
  final String origen2;
  final String hsInicio;
  final String hsFin;

  const SubTipoHsPrecioAnimado(
      {Key? key,
      required this.compraMin,
      required this.origen1,
      required this.origen2,
      required this.hsInicio,
      required this.hsFin})
      : super(key: key);
  @override
  _SubTipoHsPrecioAnimadoState createState() => _SubTipoHsPrecioAnimadoState();
}

class _SubTipoHsPrecioAnimadoState extends State<SubTipoHsPrecioAnimado>
    with SingleTickerProviderStateMixin {
  //
  late AnimationController controller;

  late Animation<double> opacidad;

  

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));

    opacidad = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.1, 1, curve: Curves.easeInOut)));

   

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
      child: _SubTipoHsPrecio(
          hsFin: widget.hsFin,
          hsInicio: widget.hsInicio,
          origen1: widget.origen1,
          origen2: widget.origen2,
          compraMin: widget.compraMin),
      builder: (BuildContext context, Widget? child) {
        return Opacity(
            opacity: opacidad.value,
            child: child);
      },
    );
  }
}

class _SubTipoHsPrecio extends StatelessWidget {
  final String compraMin;
  final String origen1;
  final String origen2;
  final String hsInicio;
  final String hsFin;

  const _SubTipoHsPrecio(
      {Key? key,
      required this.compraMin,
      required this.origen1,
      required this.origen2,
      required this.hsInicio,
      required this.hsFin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 18),
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10, bottom: 10),
            child: Text('$origen1     $origen2'),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Icon(
                  Icons.watch_later,
                  size: 17,
                ),
                SizedBox(
                  width: 3,
                ),
                Text('$hsInicio - $hsFin'),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(children: [
                  Text('Min sum - \$$compraMin'),
                ]))
          ])
        ]));
  }
}
