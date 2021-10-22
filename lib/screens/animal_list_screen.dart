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
  final String _baseURL = "http://192.168.15.6:8080";

  bool requestError = false;
  List<Animal> animals = [];

  _AnimalListScreenState() {
    findAnimals();
  }

  void findAnimals() {
    Future<List<dynamic>> future = http
        .get(
      Uri.parse('$_baseURL/animals'),
    )
        .then((value) {
      return jsonDecode(utf8.decode(value.bodyBytes));
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
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          width: double.infinity,
          child: Text(
            'AnimalDex',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.green[400],
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        padding: const EdgeInsets.all(15.0),
        children: animals.map((animal) => AnimalItem(animal)).toList(),
      ),
    );
  }
}
