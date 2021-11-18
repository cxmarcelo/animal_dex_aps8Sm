import 'dart:convert';

import 'package:animal_dex/models/animal.dart';
import 'package:animal_dex/utils/app_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AnimalService with ChangeNotifier {
  String _token;
  int _id;

  AnimalService(this._token, this._id);

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

  Future<List<Animal>> findAnimalsFavorites() async {
    final response = await http
        .get(Uri.parse(AppConfig.apiBaseURL + '/animals/favorites/$_id'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      List<Animal> animals =
          body.map((dynamic item) => Animal.fromJson(item)).toList();
      return animals;
    } else {
      throw "Falha para buscar Animais.";
    }
  }

  Future<void> deleteAnimal(int animalId) async {
    final response = await http.delete(Uri.parse(
        AppConfig.apiBaseURL + '/animals/deleteByUser/$_id/$animalId'));

    if (response.statusCode.toString().startsWith("2")) {
      notifyListeners();
    } else {
      throw "Falha para deletar Animal.";
    }
  }

  Future<void> addAnimalFavorite(int animalId) async {
    final response = await http.put(Uri.parse(
        AppConfig.apiBaseURL + '/animals/addAnimalFavorite/$_id/$animalId'));
    if (response.statusCode.toString().startsWith("2")) {
      notifyListeners();
    } else {
      throw "Falha para favoritar Animal.";
    }
  }
}
