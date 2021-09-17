import 'package:app_diseno2/bloc/platos_bloc.dart';
import 'package:flutter/material.dart';

class CategoriaAnimado extends StatefulWidget {
  final PlatosState state;

  const CategoriaAnimado({Key? key, required this.state}) : super(key: key);
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CategoriaAnimado>
    with SingleTickerProviderStateMixin {
  //
  late AnimationController controller;

  late Animation<double> opacidad;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1150));

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
      child: _Categoria(state: widget.state,),
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: opacidad.value,
          child: child,
        );
      },
    );
  }
}

class _Categoria extends StatelessWidget {
  const _Categoria({
    Key? key,
    required this.state,
  }) : super(key: key);

  final PlatosState state;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.height * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${state.categoriaSeleccionada.categoria}',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: size.height * 0.05, fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                size: size.height * 0.05,
              ))
        ],
      ),
    );
  }
}
