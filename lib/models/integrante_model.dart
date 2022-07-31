import 'dart:convert';

class IntegranteModel {
  IntegranteModel({
    required this.apellidos,
    required this.dni,
    required this.foto,
    required this.nombre,
    required this.nombres,
    required this.fotoDni1,
    required this.fotoDni2,
    required this.carneVacunacion,
  });

  final String apellidos;
  final int dni;
  final String foto;
  final String nombre;
  final String nombres;
  final String? fotoDni1;
  final String? fotoDni2;
  final String? carneVacunacion;

  factory IntegranteModel.fromJson(String str) =>
      IntegranteModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IntegranteModel.fromMap(Map<String, dynamic> json) => IntegranteModel(
        apellidos: json["apellidos"],
        dni: json["dni"],
        foto: json["foto"],
        nombre: json["nombre"],
        nombres: json["nombres"],
        fotoDni1: json["foto_dni1"],
        fotoDni2: json["foto_dni2"],
        carneVacunacion: json["carne_vacunacion"],
      );

  Map<String, dynamic> toMap() => {
        "apellidos": apellidos,
        "dni": dni,
        "foto": foto,
        "nombre": nombre,
        "nombres": nombres,
        "foto_dni1": fotoDni1,
        "foto_dni2": fotoDni2,
        "carne_vacunacion": carneVacunacion,
      };
}
