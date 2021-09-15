// To parse this JSON data, do
//
//     final platoModel = platoModelFromJson(jsonString);

import 'dart:convert';

CategoriaModel platoModelFromJson(String str) =>
    CategoriaModel.fromJson(json.decode(str));

String platoModelToJson(CategoriaModel data) => json.encode(data.toJson());

class CategoriaModel {
  CategoriaModel({
    this.id,
    this.categoria,
    this.subCategoria1,
    this.subCategoria2,
    this.subCategoria3,
    this.paisOrigen1,
    this.paisOrigen2,
    this.horaInicio,
    this.horaFin,
    this.costoDelivery,
    this.compraMin,
    this.imagenCategoria,
    this.imagenDispositivo,
    this.estado,
    this.fechaHora,
  });

  String? id;
  String? categoria;
  String? subCategoria1;
  String? subCategoria2;
  String? subCategoria3;
  String? paisOrigen1;
  String? paisOrigen2;
  String? horaInicio;
  String? horaFin;
  String? costoDelivery;
  String? compraMin;
  String? imagenCategoria;
  String? imagenDispositivo;
  String? estado;
  String? fechaHora;

  factory CategoriaModel.fromJson(Map<String, dynamic> json) => CategoriaModel(
        id: json["id"] ?? '',
        categoria: json["categoria"] ?? '',
        subCategoria1: json["subCategoria1"] ?? '',
        subCategoria2: json["subCategoria2"] ?? '',
        subCategoria3: json["subCategoria3"] ?? '',
        paisOrigen1: json["paisOrigen1"] ?? '',
        paisOrigen2: json["paisOrigen2"] ?? '',
        horaInicio: json["horaInicio"] ?? '',
        horaFin: json["horaFin"] ?? '',
        costoDelivery: json["costoDelivery"] ?? '',
        compraMin: json["compraMin"] ?? '',
        imagenCategoria: json["imagenCategoria"] ?? '',
        imagenDispositivo: json["imagenDispositivo"] ?? '',
        estado: json["estado"] ?? '',
        fechaHora: json["fechaHora"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoria": categoria,
        "subCategoria1": subCategoria1,
        "subCategoria2": subCategoria2,
        "subCategoria3": subCategoria3,
        "paisOrigen1": paisOrigen1,
        "paisOrigen2": paisOrigen2,
        "horaInicio": horaInicio,
        "horaFin": horaFin,
        "costoDelivery": costoDelivery,
        "compraMin": compraMin,
        "imagenCategoria": imagenCategoria,
        "imagenDispositivo": imagenDispositivo,
        "estado": estado,
        "fechaHora": fechaHora,
      };
}
