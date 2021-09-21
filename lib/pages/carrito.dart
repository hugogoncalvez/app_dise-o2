import 'package:app_diseno2/animation/carritoFloatingButton_animado.dart';
import 'package:app_diseno2/animation/carritoItems_animado.dart';
import 'package:app_diseno2/animation/carritoTotal_animado.dart';
import 'package:flutter/material.dart';
import 'package:app_diseno2/widget/circulo.dart';
import 'package:app_diseno2/widget/imagen_Plato.dart';
import 'package:app_diseno2/widget/rotation.dart';

class CarritoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ScrollController viewController = new ScrollController();
    final List<String> carrito = ['Pancakes - M', 'Fruit Waffles'];
    final List<String> precios = ['\$13,50', '\15,25'];
    final List<bool> adicional = [true, false];
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingButtonAnimado(size: size),
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close_rounded,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Cart',
            style:
                TextStyle(color: Colors.black, fontSize: size.height * 0.025),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              _Cabecera(size: size),
              SizedBox(height: size.height * 0.02),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: viewController,
                  itemCount: carrito.length,
                  itemBuilder: (BuildContext context, int index) {
                    String item = carrito[index];
                    String precio = precios[index];
                    bool conAdicional = adicional[index];

                    return ItemCompradoAnimado(
                      size: size,
                      conAdicional: conAdicional,
                      item: item,
                      precio: precio,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CarritoTotalcuentaAnimado(),
              SizedBox(
                height: size.height * 0.1,
              )
            ],
          ),
        ));
  }
}

class _Cabecera extends StatelessWidget {
  const _Cabecera({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.01),
      child: Container(
        width: double.infinity,
        height: (size.width <= 410) ? size.height * 0.20 : size.height * 0.18,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                width: size.width * 0.90,
                height: (size.width <= 410)
                    ? size.height * 0.175
                    : size.height * 0.165,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffE9ECF9),
                ),
              ),
            ),
            Positioned(
                top: (size.width <= 410)
                    ? size.height * 0.05
                    : size.height * 0.035,
                right: (size.width <= 410)
                    ? size.height * 0.01
                    : size.height * 0.008,
                child: Rotation(
                    blurRadius: 20,
                    dx: 5,
                    dy: 8,
                    image: 'assets/albahaca.png',
                    size: (size.width <= 410)
                        ? size.height * 0.03
                        : size.height * 0.035,
                    spreadradius: 3,
                    turns: 150)),
            Positioned(
                bottom: 4,
                left: size.height * 0.23,
                child: Rotation(
                    blurRadius: 20,
                    dx: 5,
                    dy: 8,
                    image: 'assets/albahaca.png',
                    size: (size.width <= 410)
                        ? size.height * 0.055
                        : size.height * 0.04,
                    spreadradius: 3,
                    turns: -30)),
            Positioned(
                bottom: 15,
                left: size.height * 0.15,
                child: Rotation(
                    blurRadius: 20,
                    dx: 5,
                    dy: 8,
                    image: 'assets/albahaca.png',
                    size: (size.width <= 410)
                        ? size.height * 0.035
                        : size.height * 0.030,
                    spreadradius: 3,
                    turns: 40)),
            Positioned(
                top: size.height * 0.01,
                right: (size.width <= 410)
                    ? size.height * 0.23
                    : size.height * 0.23,
                child: Circulo(radio: 10, color: Color(0xffF7FAFF))),
            Positioned(
                top: size.height * 0.11,
                right: (size.width <= 410)
                    ? size.height * 0.20
                    : size.height * 0.185,
                child: Circulo(radio: 14, color: Color(0xffD6DCF1))),
            Positioned(
              top: 5,
              right: size.height * 0.025,
              child: Imagen(
                widthContainer: (size.width <= 410)
                    ? size.height * 0.20
                    : size.height * 0.18,
                heigthContainer: (size.width <= 410)
                    ? size.height * 0.20
                    : size.height * 0.18,
                imagen: 'assets/plato.png',
                spreadRadius: 0,
                blurRadius: 0,
                opacidad: 0.0001,
              ),
            ),
            Positioned(
                left: size.height * 0.06,
                top: size.height * 0.05,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sweety bar',
                      style: TextStyle(
                          fontSize: (size.width <= 410)
                              ? size.height * 0.030
                              : size.height * 0.025,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Approx. time - 50 min.',
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
