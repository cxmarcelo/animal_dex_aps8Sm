import 'package:flutter/material.dart';
import '../models/animal.dart';
import '../screens/animal_info_screen.dart';

class AnimalItem extends StatelessWidget {
  final Animal animal;

  const AnimalItem(this.animal, {Key? key}) : super(key: key);

  void _selectAnimal(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return AnimalInfo(animal);
      }),
    );
  }

  Widget getImage() {
    String path = "";
    if (animal.phylum == "Arthropoda") {
      path = "images/arthropoda.png";
    } else if (animal.phylum == "Mollusca") {
      path = "images/mollusca.png";
    }

    if (path == "") {
      return const Icon(
        Icons.cancel_outlined,
        color: Colors.white,
        size: 100.0,
      );
    } else {
      return Image.asset(
        path,
        scale: 2.5,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Column(
        children: [
          Text(
            animal.specie,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          getImage(),
          Container(
            child: Text(
              "#" + animal.id.toString(),
              textAlign: TextAlign.center,
            ),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            width: 50,
          )
        ],
      ),
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.green.shade400)),
      onPressed: () => _selectAnimal(context),
    );
  }
}
