import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_familia/models/integrante_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class FireBaseProvider extends ChangeNotifier {
  final String _baseUrl = 'familia-718f4-default-rtdb.firebaseio.com';
  final List<IntegranteModel> integrantes = [];
  late IntegranteModel integranteSeleccionado;
  late Color currentColor1;
  late Color currentColor2;
  late String archivo1;
  late String archivo2;
  final storage = const FlutterSecureStorage();

  Future getIntegrantes() async {
    final url = Uri.https(_baseUrl, '/integrantes.json');
    final resp = await http.get(url);
    final Map<String, dynamic> integrantesMap = json.decode(resp.body);
    integrantes.clear();
    integrantesMap.forEach((key, value) {
      final tmp = IntegranteModel.fromMap(value);
      integrantes.add(tmp);
    });
    return integrantes;
  }
}
