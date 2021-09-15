import 'package:flutter/material.dart';

class ItemCategoriaAnimado extends StatefulWidget {
  final String nombre;
  final String tamanio;
  final String ingredientes;
  final String precio;
  final String peso;
  final String imagen;

  const ItemCategoriaAnimado(
      {Key? key,
      required this.nombre,
      required this.tamanio,
      required this.ingredientes,
      required this.precio,
      required this.peso,
      required this.imagen})
      : super(key: key);
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
      child: ItemCategoria(
        imagen: widget.imagen,
        ingredientes: widget.ingredientes,
        nombre: widget.nombre,
        peso: widget.peso,
        precio: widget.precio,
        tamanio: widget.tamanio,
      ),
      builder: (BuildContext context, Widget? child) {
        return Opacity(
            opacity: opacidad.value,
            child:
                Transform.scale(scale: achicar.value, child: child));
      },
    );
  }
}

class ItemCategoria extends StatelessWidget {
  final String nombre;
  final String tamanio;
  final String ingredientes;
  final String precio;
  final String peso;
  final String imagen;

  const ItemCategoria(
      {Key? key,
      required this.nombre,
      required this.tamanio,
      required this.ingredientes,
      required this.precio,
      required this.peso,
      required this.imagen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black12.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(5, 1) // changes position of shadow
              )
        ], borderRadius: BorderRadius.circular(15), color: Colors.white),
        width: double.infinity,
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 120,
              height: 110,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  image: AssetImage(imagen),
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$nombre - $tamanio',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 150,
                  child: Text(
                    '$ingredientes',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontSize: size.height * 0.015),
                  ),
                ),
                Text(
                  '\$ $precio',
                  style: TextStyle(
                      color: Color(0xff3654D0),
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$peso'),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff3654d0)),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'carrito');
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 28,
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
