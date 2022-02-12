import 'dart:convert';

import 'package:flutter/material.dart';

class MiembroModels {
  MiembroModels({
    required this.nid,
    required this.nombre,
    required this.documento,
    this.descripcion,
    this.fechaNacimiento,
    this.uuid,
    this.cuenta,
    this.alturaNacimiento,
    this.pesoNacimiento,
    this.color,
    this.archivoDocumento,
    this.archivoCovid,
  });

  String nid;
  String nombre;
  String documento;
  String? descripcion;
  String? fechaNacimiento;
  String? uuid;
  String? cuenta;
  String? alturaNacimiento;
  String? pesoNacimiento;
  Color? color;
  String? archivoDocumento;
  String? archivoCovid;

  factory MiembroModels.fromJson(String str) =>
      MiembroModels.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MiembroModels.fromMap(Map<String, dynamic> json) => MiembroModels(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        fechaNacimiento: json["fecha_nacimiento"],
        uuid: json["uuid"],
        nid: json["nid"],
        cuenta: json["cuenta"],
        documento: json["documento"],
        alturaNacimiento: json["altura_nacimiento"],
        pesoNacimiento: json["peso_nacimiento"],
        archivoDocumento: json["archivo_dni"],
        archivoCovid: json["archivo_covid"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "fecha_nacimiento": fechaNacimiento,
        "uuid": uuid,
        "nid": nid,
        "cuenta": cuenta,
        "documento": documento,
        "altura_nacimiento": alturaNacimiento,
        "peso_nacimiento": pesoNacimiento,
      };
}
