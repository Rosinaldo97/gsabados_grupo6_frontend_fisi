import 'dart:convert';

List<Producto> productoFromJson(String str) =>
    List<Producto>.from(json.decode(str).map((x) => Producto.fromJson(x)));

String productoToJson(List<Producto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Producto {
  Producto({
    required this.id,
    required this.modelo,
    required this.marca,
    required this.cantidad,
    required this.precio,
    required this.descripcion,
    required this.linkImagen,
  });

  String id;
  String modelo;
  String marca;
  String cantidad;
  String precio;
  String descripcion;
  String linkImagen;

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        id: json["id"],
        modelo: json["modelo"],
        marca: json["marca"],
        cantidad: json["cantidad"],
        precio: json["precio"],
        descripcion: json["descripcion"],
        linkImagen: json["link_imagen"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "modelo": modelo,
        "marca": marca,
        "cantidad": cantidad,
        "precio": precio,
        "descripcion": descripcion,
        "link_imagen": linkImagen,
      };
}
