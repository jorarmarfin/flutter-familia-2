import 'dart:convert';

class IntegranteModel {
    IntegranteModel({
      required  this.apellidos,
      required  this.dni,
      required  this.foto,
      required  this.nombre,
      required  this.nombres,
    });

    final String apellidos;
    final int dni;
    final String foto;
    final String nombre;
    final String nombres;

    factory IntegranteModel.fromJson(String str) => IntegranteModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory IntegranteModel.fromMap(Map<String, dynamic> json) => IntegranteModel(
        apellidos: json["apellidos"],
        dni: json["dni"],
        foto: json["foto"],
        nombre: json["nombre"],
        nombres: json["nombres"],
    );

    Map<String, dynamic> toMap() => {
        "apellidos": apellidos,
        "dni": dni,
        "foto": foto,
        "nombre": nombre,
        "nombres": nombres,
    };
}
