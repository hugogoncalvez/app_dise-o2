import 'dart:async';

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
    descripcion: 'Orange, Pecan, Maple syrup, Mascarpone',
    categorias: 'Sweety bar',
    subCategoria1: 'Americal',
    subCategoria2: 'italian',
    tamanio: 'S',
    peso: '250 g',
    imagen: 'assets/comida_1',
    estado: 'ok',
  );

  final PlatoModel plato2 = new PlatoModel();
  final PlatoModel plato3 = new PlatoModel();
  final PlatoModel plato4 = new PlatoModel();
  final PlatoModel plato5 = new PlatoModel();
  final PlatoModel plato6 = new PlatoModel();

  @override
  Stream<PlatosState> mapEventToState(
    PlatosEvent event,
  ) async* {
    if (event is OnObtienPlatos) {
      yield state.copyWith(isWorking: true, accion: 'OnobtienPlatos');
      Future.delayed(Duration(seconds: 1));
      final List<PlatoModel> lista = [];
      yield state.copyWith(isWorking: false, lstPlatos: lista);
    } else if (event is OnEstablecePlatoSeleccionado) {
      yield state.copyWith(
          isWorking: true, accion: 'OnEstablecePlatoSeleccionado');
      if (event.id != '') {
        final plato =
            state.lstPlatos.firstWhere((element) => (element.id == event.id));
        yield state.copyWith(isWorking: false, plato: plato);
      }
    }
  }
}
