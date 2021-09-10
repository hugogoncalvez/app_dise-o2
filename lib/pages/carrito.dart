import 'package:app_diseno2/widget/imagen_Plato.dart';
import 'package:app_diseno2/widget/rotation.dart';
import 'package:flutter/material.dart';

class CarritoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.close_rounded,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Cart',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: double.infinity,
                height: 140,
                color: Colors.white,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: size.width * 0.90,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffE9ECF9),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 30, //size.height * 0.04,
                        right: 5, // size.height * 0.55,
                        child: Rotation(
                            blurRadius: 20,
                            dx: 5,
                            dy: 8,
                            image: 'assets/albahaca.png',
                            size: (size.width <= 410)
                                ? size.height * 0.03
                                : size.height * 0.05,
                            spreadradius: 3,
                            turns: 150)),
                    Positioned(
                        bottom: 2, //size.height * 0.04,
                        left: size.height * 0.20, // size.height * 0.55,
                        child: Rotation(
                            blurRadius: 20,
                            dx: 5,
                            dy: 8,
                            image: 'assets/albahaca.png',
                            size: (size.width <= 410)
                                ? size.height * 0.055
                                : size.height * 0.05,
                            spreadradius: 3,
                            turns: -30)),
                    Positioned(
                        bottom: 6, //size.height * 0.04,
                        left: size.height * 0.12, // size.height * 0.55,
                        child: Rotation(
                            blurRadius: 20,
                            dx: 5,
                            dy: 8,
                            image: 'assets/albahaca.png',
                            size: (size.width <= 410)
                                ? size.height * 0.035
                                : size.height * 0.05,
                            spreadradius: 3,
                            turns: 40)),
                    Positioned(
                      top: 5,
                      right: size.height * 0.025,
                      child: Imagen(
                        widthContainer: 150,
                        heigthContainer: 150,
                        imagen: 'assets/plato.png',
                        spreadRadius: 0,
                        blurRadius: 0,
                        opacidad: 0.0001,
                      ),
                    ),
                    Positioned(
                        left: size.height * 0.07,
                        top: size.height * 0.065,
                        child: Text('Sweety bar')),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
