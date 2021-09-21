import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class ItemCompradoAnimado extends StatefulWidget {
  final Size size;
  final bool conAdicional;
  final String item;
  final String precio;

  const ItemCompradoAnimado(
      {required this.size,
      required this.conAdicional,
      required this.item,
      required this.precio});
  @override
  _ItemCompradoAnimadoState createState() => _ItemCompradoAnimadoState();
}

class _ItemCompradoAnimadoState extends State<ItemCompradoAnimado>
    with SingleTickerProviderStateMixin {
  //
  late AnimationController controller;
  late Animation<double> opacidad;
  late Animation<double> achicar;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));

    opacidad = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

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
      child: _ItemComprado(
        conAdicional: widget.conAdicional,
        item: widget.item,
        precio: widget.precio,
        size: widget.size,
      ),
      builder: (BuildContext context, Widget? child) {
        return Opacity(
            opacity: opacidad.value,
            child: Transform.scale(scale: achicar.value, child: child));
      },
    );
  }
}

class _ItemComprado extends StatelessWidget {
  const _ItemComprado({
    required this.size,
    required this.item,
    required this.precio,
    required this.conAdicional,
  });

  final Size size;
  final String item;
  final String precio;
  final bool conAdicional;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.height * 0.01, vertical: size.height * 0.01),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
        BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 15,
            offset: Offset(5, 4))
      ]),
      width: size.height * 0.01,
      height: (conAdicional) ? size.height * 0.19 : size.height * 0.086,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: size.height * 0.02, vertical: size.height * 0.025),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Text(item,
                      style: TextStyle(
                          fontSize: size.height * 0.0225,
                          fontWeight: FontWeight.bold))
                ]),
                Row(
                  children: [
                    Container(
                        // alignment: Alignment.center,
                        width: size.height * 0.0353,
                        height: size.height * 0.0353,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffF7F7FA)),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          color: Colors.black,
                          splashRadius: 0.1,
                          alignment: Alignment.center,
                          onPressed: () {},
                          icon: Icon(Icons.remove, size: size.height * 0.035),
                        )),
                    SizedBox(width: size.height * 0.014104),
                    Text(
                      '1',
                      style: TextStyle(
                          fontSize: size.height * 0.0225,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: size.height * 0.014104),
                    Container(
                        width: size.height * 0.0353,
                        height: size.height * 0.0353,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffF7F7FA)),
                        child: IconButton(
                          splashRadius: 0.1,
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(Icons.add, size: size.height * 0.035),
                        )),
                    SizedBox(width: size.height * 0.02115),
                    Text(precio,
                        style: TextStyle(
                            fontSize: size.height * 0.0225,
                            fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
            if (conAdicional)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: DottedLine(
                    direction: Axis.horizontal,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 4.0,
                    dashColor: Colors.black45,
                    dashGapLength: 4.0,
                    dashGapColor: Colors.transparent),
              ),
            if (conAdicional)
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.014104,
                    bottom: size.height * 0.021156),
                child: Text(
                  'Additional Ingredients',
                  style: TextStyle(fontSize: size.height * 0.02256),
                ),
              ),
            if (conAdicional)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.zero,
                          width: size.height * 0.0282,
                          height: size.height * 0.0282,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xffF7F7FA)),
                          child: IconButton(
                              splashRadius: 0.1,
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: Icon(
                                Icons.close_rounded,
                                size: size.height * 0.025,
                              ),
                              alignment: Alignment.center)),
                      SizedBox(width: size.height * 0.014104),
                      Text('Jam')
                    ],
                  ),
                  SizedBox(
                    width: size.height * 0.25,
                  ),
                  Text('\$1,15')
                ],
              )
          ],
        ),
      ),
    );
  }
}
