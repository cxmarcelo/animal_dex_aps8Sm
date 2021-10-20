import 'dart:convert';

import 'package:animal_dex/models/animal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../components/animal_item.dart';

class AnimalListScreen extends StatefulWidget {
  const AnimalListScreen({Key? key}) : super(key: key);

  @override
  State<AnimalListScreen> createState() => _AnimalListScreenState();
}

class _AnimalListScreenState extends State<AnimalListScreen> {
  final String _baseURL = "http://192.168.15.18:8080";

  bool requestError = false;

  List<dynamic> animals = [];

  void findAnimals() {
    Future<List<dynamic>> future = http
        .get(
      Uri.parse('$_baseURL/animals'),
    )
        .then((value) {
      return jsonDecode(value.body);
    });

    future.then((animalsList) {
      setState(() {
        animals = animalsList.map((dyn) {
          return Animal(
              dyn["id"],
              dyn["popularName"],
              dyn["specie"],
              dyn["familly"],
              dyn["orderName"],
              dyn["phylum"],
              dyn["poisonous"],
              dyn["description"],
              dyn["weight"],
              dyn["height"],
              dyn["imageId"]);
        }).toList();
      });
    }).catchError((error) {
      setState(() {
        requestError = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    findAnimals();

    return requestError
        ? const Center(
            child: Text("Error na requisição dos Animais"),
          )
        : GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            padding: const EdgeInsets.all(15.0),
            children: animals.map((animal) => AnimalItem(animal)).toList(),
          );
  }
}
