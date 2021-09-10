part of 'platos_bloc.dart';

@immutable
abstract class PlatosEvent {}

class OnObtienPlatos extends PlatosEvent {
  OnObtienPlatos();
}

class OnEstablecePlatoSeleccionado extends PlatosEvent {
  final String id;
  OnEstablecePlatoSeleccionado(this.id);
}
