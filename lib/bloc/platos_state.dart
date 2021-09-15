part of 'platos_bloc.dart';

@immutable
class PlatosState {
  final bool isWorking;
  final PlatoModel plato;
  final List<PlatoModel> lstPlatos;  
  final List<CategoriaModel> lstCategorias;
  final CategoriaModel categoriaSeleccionada;
   List<PlatoModel> lstPlatosSCategorias;
  final String accion;

  PlatosState({
    this.accion = '',
    this.isWorking = false,
    plato,
    lstPlatos,
    lstCategorias,
    categoriaSeleccionada,
    lstPlatosSCategorias,
  })  : this.plato = plato ?? new PlatoModel(),
        this.lstPlatosSCategorias = lstPlatosSCategorias ?? [],
        this.categoriaSeleccionada =
            categoriaSeleccionada ?? new CategoriaModel(),
        this.lstPlatos = lstPlatos ?? [],
        this.lstCategorias = lstCategorias ?? [];

  PlatosState copyWith({
    bool? isWorking,
    PlatoModel? plato,
    List<PlatoModel>? lstPlatos,
    List<CategoriaModel>? lstCategorias,
    CategoriaModel? categoriaSeleccionada,
    List<PlatoModel>? lstPlatosSCategorias,
    String? accion,
  }) =>
      PlatosState(
          isWorking: isWorking ?? this.isWorking,
          plato: plato ?? this.plato,
          lstPlatos: lstPlatos ?? this.lstPlatos,
          lstCategorias: lstCategorias ?? this.lstCategorias,
          categoriaSeleccionada:
              categoriaSeleccionada ?? this.categoriaSeleccionada,
          lstPlatosSCategorias:
              lstPlatosSCategorias ?? this.lstPlatosSCategorias,
          accion: accion ?? this.accion);

  PlatosState initState() => new PlatosState();
}
