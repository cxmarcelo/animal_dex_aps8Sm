import 'package:animal_dex/models/animal.dart';
import 'package:flutter/material.dart';

class AnimalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Animal animal = ModalRoute.of(context)!.settings.arguments as Animal;

    return Scaffold(
      appBar: AppBar(
          title: Text(
        animal.specie,
        textAlign: TextAlign.center,
      )),
      body: Center(
        child: Text("Tela de informações"),
      ),
    );
  }
}
