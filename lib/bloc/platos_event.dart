part of 'platos_bloc.dart';

@immutable
abstract class PlatosEvent {}

class OnObtienPlatos extends PlatosEvent {
  OnObtienPlatos();
}

class OnObtienCategorias extends PlatosEvent {
  OnObtienCategorias();
}

class OnEstablecePlatoSeleccionado extends PlatosEvent {
  final String id;
  OnEstablecePlatoSeleccionado(this.id);
}

class OnEstableceCategoriaSeleccionada extends PlatosEvent {
  final String id;
  OnEstableceCategoriaSeleccionada(this.id);
}


class OnPlatosPorCategoriaSeleccionada extends PlatosEvent {
  final String categoria;
  OnPlatosPorCategoriaSeleccionada(this.categoria);
}