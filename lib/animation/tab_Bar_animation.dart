import 'package:app_diseno2/animation/itemCategoria_animado.dart';
import 'package:flutter/material.dart';

class TabControllerAnimado extends StatefulWidget {

  @override
  _TabControllerAnimadoState createState() => _TabControllerAnimadoState();
}

class _TabControllerAnimadoState extends State<TabControllerAnimado>
    with SingleTickerProviderStateMixin {
  //
  late AnimationController controller;

  late Animation<double> opacidad;

  late Animation<double> moverIzquierda;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    opacidad = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.2, 1, curve: Curves.easeInOut)));

    moverIzquierda = Tween(begin: 100.0, end: 0.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.2, 1, curve: Curves.easeInOut)));

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
      child: _TabController(),
      builder: (BuildContext context, Widget? childRectangulo) {
        return Opacity(
            opacity: opacidad.value,
            child: Transform.translate(
                offset: Offset(moverIzquierda.value, 0),
                child: childRectangulo));
      },
    );
  }
}

class _TabController extends StatefulWidget {
  const _TabController({
    Key? key,
  }) : super(key: key);

  @override
  _TabControllerState createState() => _TabControllerState();
}

class _TabControllerState extends State<_TabController> {
  FontWeight weight1 = FontWeight.bold;

  FontWeight weight2 = FontWeight.normal;

  FontWeight weight3 = FontWeight.normal;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final stiloTabBar = TextStyle(color: Colors.black, fontSize: 19);
    return Column(
      children: [
        TabBar(
          onTap: (index) {
            if (index == 0) {
              weight1 = FontWeight.bold;
              weight2 = FontWeight.normal;
              weight3 = FontWeight.normal;
            } else if (index == 1) {
              weight1 = FontWeight.normal;
              weight2 = FontWeight.bold;
              weight3 = FontWeight.normal;
            } else {
              weight1 = FontWeight.normal;
              weight2 = FontWeight.normal;
              weight3 = FontWeight.bold;
            }
            setState(() {});
          },
          indicator: UnderlineTabIndicator(
              insets: EdgeInsets.symmetric(horizontal: 30),
              borderSide: BorderSide(width: 3, color: Color(0xffB2452E))),
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(
              child: Container(
                  width: size.width * 0.22,
                  child: Text('Breakfast',
                      style: stiloTabBar.copyWith(fontWeight: weight1),
                      textAlign: TextAlign.center)),
            ),
            Tab(
              child: Container(
                  width: size.width * 0.28,
                  child: Text('Main dishes',
                      style: stiloTabBar.copyWith(fontWeight: weight2),
                      textAlign: TextAlign.center)),
            ),
            Tab(
              child: Container(
                  width: size.width * 0.20,
                  child: Text('Desserts',
                      style: stiloTabBar.copyWith(fontWeight: weight3),
                      textAlign: TextAlign.center)),
            )
          ],
        ),
        Container(
          width: double.infinity,
          height: size.height * 0.50,
          child: TabBarView(
            children: [
              ItemsCategoriaSelecionada(),
              ItemsCategoriaSelecionada(),
              ItemsCategoriaSelecionada(),
            ],
          ),
        )
      ],
    );
  }
}

class ItemsCategoriaSelecionada extends StatelessWidget {
  final ScrollController viewController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    final List<String> ingredientes = [
      'Orenges',
      'Pecan',
      'Maple Syrup',
      'Mascarpone'
    ];
    final String item = 'Pancakes';
    final String peso = ' 250 g';
    final String precio = '12,50';
    final String tamanio = 'S';

    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        controller: viewController,
        itemCount: 3,
        itemBuilder: (_, index) {
          return ItemCategoriaAnimado(
            ingredientes: ingredientes,
            item: item,
            peso: peso,
            precio: precio,
            tamanio: tamanio,
            imagen: 'assets/comida_${index + 1}.jpg',
          );
        });
  }
}


