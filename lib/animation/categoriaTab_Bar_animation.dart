import 'package:app_diseno2/animation/categoriaItem_animado.dart';
import 'package:app_diseno2/bloc/platos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabControllerAnimado extends StatefulWidget {
  final PlatosState state;

  const TabControllerAnimado({required this.state});
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
        vsync: this, duration: Duration(milliseconds: 1150));

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
      child: _TabController(
        state: widget.state,
      ),
      builder: (BuildContext context, Widget? child) {
        return Opacity(
            opacity: opacidad.value,
            child: Transform.translate(
                offset: Offset(moverIzquierda.value, 0), child: child));
      },
    );
  }
}

class _TabController extends StatefulWidget {
  final PlatosState state;

  const _TabController({required this.state});

  @override
  _TabControllerState createState() => _TabControllerState();
}

class _TabControllerState extends State<_TabController> {
  FontWeight weight1 = FontWeight.bold;

  FontWeight weight2 = FontWeight.normal;

  FontWeight weight3 = FontWeight.normal;
  @override
  Widget build(BuildContext context) {
    final platosBloc = BlocProvider.of<PlatosBloc>(context);
    // platosBloc.add(OnObtienPlatos());
    platosBloc.add(OnPlatosPorCategoriaSeleccionada(
        widget.state.categoriaSeleccionada.categoria.toString()));

    //
    final size = MediaQuery.of(context).size;
    final stiloTabBar =
        TextStyle(color: Colors.black, fontSize: size.height * 0.020);
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
          height: (size.height < 550) ? size.height * 0.50 : size.height * 0.55,
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
    final Size size = MediaQuery.of(context).size;

    return BlocBuilder<PlatosBloc, PlatosState>(builder: (_, state) {
      if (state.lstPlatosSCategorias.length > 0) {
        return ListView.builder(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            controller: viewController,
            itemCount: state.lstPlatosSCategorias.length,
            itemBuilder: (_, index) {
              return ItemCategoriaAnimado(state, index);
            });
      } else {
        return Center(
            child: Container(
                child: Text(
          'No hay items para ésta categoría',
          style: TextStyle(fontSize: size.height * 0.035),
        )));
      }
    });
  }
}
