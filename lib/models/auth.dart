import 'dart:convert';

import 'package:animal_dex/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String? _token;
  int? _id;
  DateTime? _expiryDate;

  bool get isAuth {
    final isValid = _expiryDate?.isAfter(DateTime.now()) ?? false;
    return _token != null && isValid;
  }

  String? get token {
    return isAuth ? _token : null;
  }

  int? get id {
    return isAuth ? _id : null;
  }

  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }

  Future<void> login(String login, String password) async {
    var headers = {
      'enctype': 'multipart/form-data',
      'Content-Type': 'application/json'
    };
    final response = await http.post(Uri.parse(AppConfig.apiBaseURL + "/login"),
        body: jsonEncode({
          'login': login,
          'password': password,
        }),
        headers: headers);

    if (response.statusCode.toString().startsWith("2")) {
      _token = response.headers["authorization"]!.substring(7);
      _expiryDate = DateTime.now().add(const Duration(hours: 6));
      Map<String, dynamic> claims = parseJwt(token!);
      print("Antes");
      _id = claims["id"];
      print("Depois: $_id");
      notifyListeners();
    } else {
      if (response.body.isNotEmpty) {
        final body = jsonDecode(response.body);
        if (body["error"]) {
          throw Exception(body['error']["msg"]);
        }
      }
    }
  }

  Future<void> signUp(
      String login, String password, String name, String email) async {
    var headers = {
      'enctype': 'multipart/form-data',
      'Content-Type': 'application/json'
    };
    final response =
        await http.post(Uri.parse(AppConfig.apiBaseURL + "/users/register"),
            body: jsonEncode({
              'login': login,
              'password': password,
              'name': name,
              'email': email,
            }),
            headers: headers);
  }
}
