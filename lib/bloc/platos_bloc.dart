import 'dart:async';

import 'package:app_diseno2/data/model/categoria_model.dart';
import 'package:app_diseno2/data/model/plato_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'platos_event.dart';
part 'platos_state.dart';

class PlatosBloc extends Bloc<PlatosEvent, PlatosState> {
  PlatosBloc() : super(PlatosState());

  final PlatoModel plato1 = new PlatoModel(
    id: '1',
    nombre: 'Pancakes',
    descripcion: 'Frutilla, Crema, Crema Pastelera',
    categoria: 'Sweety bar',
    tamanio: 'S',
    peso: '250 g',
    precio: '12,50',
    imagenPlato: 'assets/panckesS.jpg',
    estado: 'ok',
  );

  final PlatoModel plato2 = new PlatoModel(
    id: '2',
    nombre: 'Pancakes',
    descripcion: 'Frutilla, Crema, Crema Pastelera',
    categoria: 'Sweety bar',
    tamanio: 'M',
    peso: '300 g',
    precio: '12,50',
    imagenPlato: 'assets/panckesS.jpg',
    estado: 'ok',
  );
  final PlatoModel plato3 = new PlatoModel(
    id: '3',
    nombre: 'Tarta',
    descripcion: 'Frutilla, Crema, Dulce de Lecha',
    categoria: 'Sweety bar',
    tamanio: 'M',
    precio: '12,50',
    peso: '250 g',
    imagenPlato: 'assets/tartaM.jpg',
    estado: 'ok',
  );

  final CategoriaModel categoria1 = new CategoriaModel(
      id: '1',
      categoria: 'Sweety bar',
      subCategoria1: 'BreakFast',
      subCategoria2: 'Main dishes',
      subCategoria3: 'Desserts',
      paisOrigen1: 'American',
      paisOrigen2: 'Italian',
      horaInicio: '10:00',
      horaFin: '22:00',
      costoDelivery: '3',
      compraMin: '20',
      imagenCategoria: 'assets/categoriaDulces.jpg');
  final CategoriaModel categoria2 = new CategoriaModel(
      id: '2',
      categoria: 'Pizzas bar',
      subCategoria1: 'BreakFast',
      subCategoria2: 'Main dishes',
      subCategoria3: 'Desserts',
      paisOrigen1: 'Italian',
      paisOrigen2: '',
      horaInicio: '10:00',
      horaFin: '22:00',
      costoDelivery: '3',
      compraMin: '30',
      imagenCategoria: 'assets/categoriaSaladosPizzas.jpg');
  final CategoriaModel categoria3 = new CategoriaModel(
      id: '3',
      categoria: 'Hamburger bar',
      subCategoria1: 'BreakFast',
      subCategoria2: 'Main dishes',
      subCategoria3: 'Desserts',
      paisOrigen1: 'American',
      paisOrigen2: '',
      horaInicio: '10:00',
      horaFin: '22:00',
      costoDelivery: '3',
      compraMin: '20',
      imagenCategoria: 'assets/categoriaSaladosHambur.jpg');
  @override
  Stream<PlatosState> mapEventToState(
    PlatosEvent event,
  ) async* {
    if (event is OnObtienPlatos) {
      yield state.copyWith(isWorking: true, accion: 'OnObtienPlatos');
      Future.delayed(Duration(seconds: 1));
      final List<PlatoModel> lista = [];
      lista.add(plato1);
      lista.add(plato2);
      lista.add(plato3);

      yield state.copyWith(isWorking: false, lstPlatos: lista);
    } else if (event is OnEstablecePlatoSeleccionado) {
      yield state.copyWith(
          isWorking: true, accion: 'OnEstablecePlatoSeleccionado');
      if (event.id != '') {
        final plato =
            state.lstPlatos.firstWhere((element) => (element.id == event.id));
        yield state.copyWith(isWorking: false, plato: plato);
      }
    } else if (event is OnPlatosPorCategoriaSeleccionada) {
      yield state.copyWith(
          isWorking: true, accion: 'OnPlatosPorCategoriaSeleccionada');
      if (event.categoria != '') {
        final lstPlatosCategoria = state.lstPlatos
            .where((element) => (element.categoria == event.categoria))
            .toList();
        yield state.copyWith(
            isWorking: false, lstPlatosSCategorias: lstPlatosCategoria);
      }
    } else if (event is OnEstableceCategoriaSeleccionada) {
      yield state.copyWith(
          isWorking: true, accion: 'OnEstableceCategoriaSeleccionada');
      if (event.id != '') {
        final categoriaSeleccionada = state.lstCategorias
            .firstWhere((element) => (element.id == event.id));

        yield state.copyWith(
            isWorking: false, categoriaSeleccionada: categoriaSeleccionada);
      }
    } else if (event is OnObtienCategorias) {
      yield state.copyWith(isWorking: true, accion: 'OnObtienPlatos');
      Future.delayed(Duration(seconds: 1));
      final List<CategoriaModel> listaCat = [];
      listaCat.add(categoria1);
      listaCat.add(categoria2);
      listaCat.add(categoria3);

      yield state.copyWith(isWorking: false, lstCategorias: listaCat);
    }
  }
}
