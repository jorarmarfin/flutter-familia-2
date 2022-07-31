import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  // final String _baseUrl = 'familia-718f4-default-rtdb.firebaseio.com';
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyA6XOdv1KuL93_IlDdf3Th93jfY-WuDDBs';

  final storage = const FlutterSecureStorage();
  static String token = '';

  LoginProvider() {
    estaLogeado();
  }

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    final url = Uri.https(
        _baseUrl, '/v1/accounts:signInWithPassword', {'key': _firebaseToken});

    final resp = await http.post(url, body: jsonEncode(authData));
    // print(resp.body);
    final Map<String, dynamic> decodeResp = jsonDecode(resp.body);
    if (decodeResp.containsKey('idToken')) {
      storage.write(key: 'token', value: decodeResp['idToken']);
      token = decodeResp['idToken'];
      return 'se guardo token';
    } else {
      return 'error';
    }
  }

  Future logout() async {
    storage.delete(key: 'token');
    return;
  }

  Future estaLogeado() async {
    const storage = FlutterSecureStorage();
    token = storage.read(key: 'token').toString();
    // token = '';
  }
}
