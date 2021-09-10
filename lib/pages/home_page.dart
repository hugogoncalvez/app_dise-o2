import 'package:app_diseno2/widget/selectorCategoria.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<String> listaUbicacion = [
    'Current location',
    'Location1',
    'Location2'
  ];
  final String dropDownValue = 'Current location';
  late String categoria;
  final ScrollController viewController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    final Color color = Color(0xffF5F5F8);
    final size = MediaQuery.of(context).size;
    final Map<String, IconData> categoriaSelector = {
                  "Todas": Icons.restaurant_menu,
                  "Pizzas": Icons.local_pizza,
                  "Haburguesas": Icons.lunch_dining,
                  "China": Icons.ramen_dining,
                  "Postres": Icons.icecream,
                  "Cafes": Icons.coffee,
                  "Otros": Icons.more_horiz
                };

    return Scaffold(
        drawer: Drawer(elevation: 0),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: _AppBar(
                size: size,
                color: color,
                dropDownValue: dropDownValue,
                listaUbicacion: listaUbicacion)),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(left: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                child: Text(
              'Hello, Dilan',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )),
            Container(
                child: Text(
              'What do you want to eat?',
              style: TextStyle(
                fontSize: 20,
              ),
            )),
            SizedBox(height: 25),
            Container(
              height: 60,
              color: Color(0xffF5F5F5),
              child: CategorySelectionWidget(
                categorias: categoriaSelector,
                onValueChanged: (newCategory) => categoria = newCategory,
              ),
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Text(
                  'All categories',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  child: Text(
                    '.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Text('delivery \$3')
              ],
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: viewController,
                  itemCount: 3,
                  itemBuilder: (_, index) {
                    return ItemMenu(
                      categoria: 'Sweety bar',
                      hsFin: '22:00',
                      hsInicio: '10.00',
                      imagen: 'assets/comida_${index + 1}.jpg',
                      origen1: 'American',
                      origen2: 'Italian',
                      precioMin: '20',
                    );
                  }),
            )
          ]),
        ));
  }
}

class ItemMenu extends StatelessWidget {
  const ItemMenu(
      {Key? key,
      required this.imagen,
      required this.categoria,
      required this.precioMin,
      required this.origen1,
      required this.origen2,
      required this.hsInicio,
      required this.hsFin})
      : super(key: key);

  final String imagen;
  final String categoria;
  final String precioMin;
  final String origen1;
  final String origen2;
  final String hsInicio;
  final String hsFin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 10),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'categoria', arguments: imagen);
              },
              child: Hero(
                tag: imagen,
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
            ),
            Positioned(
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12.withOpacity(0.1),
                          // spreadRadius: 2,
                          blurRadius: 15,
                          offset: Offset(5, 1) // changes position of shadow
                          )
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: DescripcionMenu(
                  categoria: categoria,
                  hsFin: hsFin,
                  hsInicio: hsInicio,
                  origen1: origen1,
                  origen2: origen2,
                  precioMin: precioMin,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DescripcionMenu extends StatelessWidget {
  const DescripcionMenu(
      {Key? key,
      required this.categoria,
      required this.precioMin,
      required this.origen1,
      required this.origen2,
      required this.hsInicio,
      required this.hsFin})
      : super(key: key);

  final String categoria;
  final String precioMin;
  final String origen1;
  final String origen2;
  final String hsInicio;
  final String hsFin;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 200,
              child: Text(
                '$categoria',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(children: [
              Text('Min  -  \$ $precioMin'),
            ])
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15, top: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('$origen1     $origen2'),
            SizedBox(
              width: 80,
            ),
            Row(children: [
              Icon(
                Icons.watch_later,
                size: 17,
              ),
              Text('$hsInicio - $hsFin'),
            ])
          ],
        ),
      )
    ]);
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
    required this.size,
    required this.color,
    required this.dropDownValue,
    required this.listaUbicacion,
  }) : super(key: key);

  final Size size;
  final Color color;
  final String dropDownValue;
  final List<String> listaUbicacion;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Container(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search,
                      color: Colors.black, size: size.height * 0.0384)),
              width: size.height * 0.055,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xffF7F7FA))),
          SizedBox(width: 2),
          Container(
            width: size.height * 0.055,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xffF7F7FA)),
            child: Stack(alignment: Alignment.center, children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.list,
                      color: Colors.black, size: size.height * 0.0384)),
              Positioned(
                  top: 2,
                  right: -5,
                  child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      width: (size.height > 781)
                          ? size.height * 0.0384
                          : size.height * 0.025,
                      child: Text('2',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white)))),
            ]),
          ),
          SizedBox(
            width: 5,
          )
        ],
        centerTitle: true,
        title: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            width:
                (size.height > 781) ? size.height * 0.217 : size.height * 0.25,
            height: 39,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: color),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  elevation: 0,
                  onChanged: (_) {},
                  value: dropDownValue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: listaUbicacion.map((String listaUbicacion) {
                    return DropdownMenuItem(
                        value: listaUbicacion, child: Text(listaUbicacion));
                  }).toList()),
            )));
  }
}
