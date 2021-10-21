import 'package:flutter/material.dart';
import '../models/animal.dart';

class AnimalItem extends StatelessWidget {
  final Animal animal;

  const AnimalItem(this.animal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Column(
        children: [
          Text(
            animal.specie,
            style: TextStyle(color: Colors.white),
          ),
          const Icon(
            Icons.adb_sharp,
            color: Colors.white,
            size: 130.0,
          ),
          Container(
            child: Text("#00" + animal.id.toString()),
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            width: 45,
          )
        ],
      ),
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.green.shade400)),
      onPressed: null,
    );
  }
}
