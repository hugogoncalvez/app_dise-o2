import 'package:flutter/material.dart';

class FloatingButtonAnimado extends StatefulWidget {
  final Size size;

  const FloatingButtonAnimado({required this.size});
  @override
  _FloatingButtonAnimadoState createState() => _FloatingButtonAnimadoState();
}

class _FloatingButtonAnimadoState extends State<FloatingButtonAnimado>
    with SingleTickerProviderStateMixin {
  //
  late AnimationController controller;

  late Animation<double> moverIzquierda;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));

    moverIzquierda = Tween(begin: -200.0, end: 0.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutBack));

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
      child: _FloatingActionButton(
        size: widget.size,
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
            offset: Offset(moverIzquierda.value, 0), child: child);
      },
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.height * 0.3,
      height: size.height * 0.065,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'pago');
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(35.0))),
        backgroundColor: Color(0xffFF6339),
        child: Text(
          'Next',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
