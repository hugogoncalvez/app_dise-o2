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
    this.categorias,
    this.subCategoria1,
    this.subCategoria2,
    this.tamanio,
    this.peso,
    this.imagen,
    this.imagenDispositivo,
    this.estado,
    this.fechaHora,
  });

  final String? id;
  final String? nombre;
  final String? descripcion;
  final String? categorias;
  final String? subCategoria1;
  final String? subCategoria2;
  final String? tamanio;
  final String? peso;
  final String? imagen;
  final String? imagenDispositivo;
  final String? estado;
  final String? fechaHora;

  factory PlatoModel.fromJson(Map<String, dynamic> json) => PlatoModel(
        id: json["id"] ?? '',
        nombre: json["nombre"] ?? '',
        descripcion: json["descripcion"] ?? '',
        categorias: json["categoris"] ?? '',
        subCategoria1: json["subCategoria1"] ?? '',
        subCategoria2: json["subCategoria2"] ?? '',
        tamanio: json["tamanio"] ?? '',
        peso: json["peso"] ?? '',
        imagen: json["imagen"] ?? '',
        imagenDispositivo: json["imagenDispositivo"] ?? '',
        estado: json["estado"] ?? '',
        fechaHora: json["fechaHora"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "categoris": categorias,
        "subCategoria1": subCategoria1,
        "subCategoria2": subCategoria2,
        "tamanio": tamanio,
        "peso": peso,
        "imagen": imagen,
        "imagenDispositivo": imagenDispositivo,
        "estado": estado,
        "fechaHora": fechaHora,
      };
}
