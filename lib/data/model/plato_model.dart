// To parse this JSON data, do
//
//     final platoModel = platoModelFromJson(jsonString);

import 'dart:convert';

PlatoModel platoModelFromJson(String str) =>
    PlatoModel.fromJson(json.decode(str));

String platoModelToJson(PlatoModel data) => json.encode(data.toJson());

class PlatoModel {
  PlatoModel({
    this.id,
    this.nombre,
    this.descripcion,
    this.categoria,
    this.tamanio,
    this.peso,
    this.imagenPlato,
    this.imagenDispositivo,
    this.estado,
    this.fechaHora,
    this.precio,
  });

  final String? id;
  final String? nombre;
  final String? descripcion;
  final String? categoria;
  final String? tamanio;
  final String? peso;
  final String? precio;

  final String? imagenPlato;
  final String? imagenDispositivo;
  final String? estado;
  final String? fechaHora;

  factory PlatoModel.fromJson(Map<String, dynamic> json) => PlatoModel(
      id: json["id"] ?? '',
      nombre: json["nombre"] ?? '',
      descripcion: json["descripcion"] ?? '',
      categoria: json["categoris"] ?? '',
      
      tamanio: json["tamanio"] ?? '',
      peso: json["peso"] ?? '',
      precio: json["precio"] ?? '',
      
      imagenPlato: json["imagen"] ?? '',
      imagenDispositivo: json["imagenDispositivo"] ?? '',
      estado: json["estado"] ?? '',
      fechaHora: json["fechaHora"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "categoris": categoria,
       
        "tamanio": tamanio,
        "peso": peso,
        "precio": precio,
        
        "imagenPlato": imagenPlato,
        "imagenDispositivo": imagenDispositivo,
        "estado": estado,
        "fechaHora": fechaHora,
       
      };
}
