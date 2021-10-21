import 'package:animal_dex/models/animal.dart';
import 'package:flutter/material.dart';

class AnimalInfo extends StatelessWidget {
  Animal animal;

  AnimalInfo(this.animal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
