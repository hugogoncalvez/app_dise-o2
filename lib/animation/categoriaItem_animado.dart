import 'package:app_diseno2/bloc/platos_bloc.dart';
import 'package:flutter/material.dart';

class ItemCategoriaAnimado extends StatefulWidget {
  final PlatosState state;
  final int index;

  const ItemCategoriaAnimado(this.state, this.index);
  @override
  _ItemCategoriaAnimadoState createState() => _ItemCategoriaAnimadoState();
}

class _ItemCategoriaAnimadoState extends State<ItemCategoriaAnimado>
    with SingleTickerProviderStateMixin {
  //
  late AnimationController controller;
  late Animation<double> opacidad;
  late Animation<double> achicar;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));

    opacidad = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.3, 1, curve: Curves.easeInOut)));

    achicar = Tween(begin: 2.0, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

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
      child: ItemCategoria(widget.state, widget.index),
      builder: (BuildContext context, Widget? child) {
        return Opacity(
            opacity: opacidad.value,
            child: Transform.scale(scale: achicar.value, child: child));
      },
    );
  }
}

class ItemCategoria extends StatelessWidget {
  final PlatosState state;
  final int index;

  const ItemCategoria(
    this.state,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          bottom: 5, left: size.height * 0.01, right: size.height * 0.010),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black12.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(5, 1) // changes position of shadow
              )
        ], borderRadius: BorderRadius.circular(15), color: Colors.white),
        width: double.infinity,
        height: size.height * 0.18,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: size.height * 0.12,
              height: size.height * 0.13,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  image: AssetImage(
                      state.lstPlatosSCategorias[index].imagenPlato!),
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.height * 0.001),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${state.lstPlatosSCategorias[index].nombre!} - ${state.lstPlatosSCategorias[index].tamanio!}',
                    style: TextStyle(
                        fontSize: size.height * 0.03,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: size.height * 0.25,
                    child: Text(
                      '${state.lstPlatosSCategorias[index].descripcion!}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: size.height * 0.015),
                    ),
                  ),
                  Text(
                    '\$ ${state.lstPlatosSCategorias[index].precio!}',
                    style: TextStyle(
                        color: Color(0xff3654D0),
                        fontSize: size.height * 0.03,
                        fontWeight: FontWeight.w900),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02,
                  horizontal: size.height * 0.015),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${state.lstPlatosSCategorias[index].peso!}'),
                  Container(
                    width: size.height * 0.04,
                    height: size.height * 0.04,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff3654d0)),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.pushNamed(context, 'carrito');
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: size.height * 0.04,
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
