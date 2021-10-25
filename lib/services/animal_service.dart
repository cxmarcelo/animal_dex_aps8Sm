import 'dart:convert';

import 'package:animal_dex/models/animal.dart';
import 'package:animal_dex/utils/app_config.dart';
import 'package:http/http.dart' as http;

class AnimalService {
  Future<List<Animal>> findAnimals() async {
    final response =
        await http.get(Uri.parse(AppConfig.apiBaseURL + '/animals'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      List<Animal> animals =
          body.map((dynamic item) => Animal.fromJson(item)).toList();
      return animals;
    } else {
      throw "Falha para buscar Animais.";
    }
  }
}
