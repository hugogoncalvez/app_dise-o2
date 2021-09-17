import 'package:flutter/material.dart';
import 'package:app_diseno2/widget/selectorCategoria.dart';
import 'package:app_diseno2/bloc/platos_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final List<String> listaUbicacion = [
    'Current location',
    'Location1',
    'Location2'
  ];
  final String dropDownValue = 'Current location';
  String categoria = '';
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
    final platosBloc = BlocProvider.of<PlatosBloc>(context);
    platosBloc.add(OnObtienCategorias());
    platosBloc.add(OnObtienPlatos());

    return Scaffold(
      drawer: Drawer(elevation: 0),
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              _SliverAppBar(
                  size: size,
                  color: color,
                  dropDownValue: dropDownValue,
                  listaUbicacion: listaUbicacion),
            ];
          },
          body: Container(
            width: double.infinity,
            color: Colors.white,
            height: size.height,
            padding: EdgeInsets.only(left: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  child: Text(
                'Hello, Dilan',
                style: TextStyle(
                    fontSize: size.height * 0.035, fontWeight: FontWeight.bold),
              )),
              Container(
                  child: Text(
                'What do you want to eat?',
                style: TextStyle(
                  fontSize: size.height * 0.025,
                ),
              )),
              SizedBox(height: size.height * 0.025),
              Container(
                height: (size.height < 535)
                    ? size.height * 0.12
                    : size.height * 0.09,
                color: Color(0xffF5F5F5),
                child: CategorySelectionWidget(
                  categorias: categoriaSelector,
                  onValueChanged: (newCategory) => categoria = newCategory,
                ),
              ),
              SizedBox(height: size.height * 0.025),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'All categories - ',
                    style: TextStyle(
                        fontSize: size.height * 0.03,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'delivery \$3',
                    style: TextStyle(fontSize: size.height * 0.02),
                  )
                ],
              ),
              Expanded(
                child: BlocBuilder<PlatosBloc, PlatosState>(
                  builder: (_, state) {
                    return Scrollbar(
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: BouncingScrollPhysics(),
                          itemCount: state.lstCategorias.length,
                          itemBuilder: (_, index) {
                            return ItemMenu(state, index);
                          }),
                    );
                  },
                ),
              )
            ]),
          )),
    );
  }
}

class _SliverAppBar extends StatelessWidget {
  const _SliverAppBar({
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
    final Size size = MediaQuery.of(context).size;
    return SliverAppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        Container(
            child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(Icons.search,
                    color: Colors.black, size: size.height * 0.0384)),
            width: size.height * 0.055,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Color(0xffF7F7FA))),
        Container(
          width: size.height * 0.055,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Color(0xffF7F7FA)),
          child: Stack(alignment: Alignment.center, children: [
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(Icons.list,
                    color: Colors.black, size: size.height * 0.0384)),
            Positioned(
                top: 2,
                right: 0,
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
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.height * 0.018)))),
          ]),
        ),
        SizedBox(
          width: 5,
        )
      ],
      centerTitle: true,
      title: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          width: (size.height > 781) ? size.height * 0.217 : size.height * 0.3,
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
          )),
    );
  }
}

class ItemMenu extends StatelessWidget {
  const ItemMenu(
    this.state,
    this.index,
  );

  final PlatosState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    final platosBloc = BlocProvider.of<PlatosBloc>(context);
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          bottom: size.height * 0.001, right: size.height * 0.01),
      child: Container(
        width: double.infinity,
        height: size.height * 0.25,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GestureDetector(
              onTap: () {
                platosBloc.add(OnEstableceCategoriaSeleccionada(
                    state.lstCategorias[index].id!));
                Navigator.pushNamed(context, 'categoria');
              },
              child: Hero(
                tag: state.lstCategorias[index].imagenCategoria!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    image:
                        AssetImage(state.lstCategorias[index].imagenCategoria!),
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
                height: size.height * 0.1,
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
                child: DescripcionMenu(state, index),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DescripcionMenu extends StatelessWidget {
  const DescripcionMenu(this.state, this.index);

  final PlatosState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(
            left: size.height * 0.015,
            right: size.height * 0.015,
            top: size.height * 0.015),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.height * 0.3,
              child: Text(
                '${state.lstCategorias[index].categoria!}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: size.height * 0.023, fontWeight: FontWeight.bold),
              ),
            ),
            Row(children: [
              Text('Min  -  \$ ${state.lstCategorias[index].compraMin}'),
            ])
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 5, top: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
                '${state.lstCategorias[index].paisOrigen1}     ${state.lstCategorias[index].paisOrigen2}'),
            SizedBox(
              width: size.height * 0.10,
            ),
            Row(children: [
              Icon(
                Icons.watch_later,
                size: 17,
              ),
              Text(
                  '${state.lstCategorias[index].horaInicio} - ${state.lstCategorias[index].horaFin}'),
            ])
          ],
        ),
      )
    ]);
  }
}
