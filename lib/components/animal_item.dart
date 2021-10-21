import 'package:animal_dex/utils/app_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/animal.dart';
import '../screens/animal_info_screen.dart';

class AnimalItem extends StatelessWidget {
  final Animal animal;

  const AnimalItem(this.animal, {Key? key}) : super(key: key);

  void _selectAnimal(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.animalInfo,
      arguments: animal,
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
        height: 120,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectAnimal(context);
      },
      borderRadius: BorderRadius.circular(15),
      //splashColor: Theme.of(context).primaryColor,
      child: Container(
        child: Column(
          children: [
            Text(animal.specie,
                style: const TextStyle(color: Colors.white, fontSize: 12)),
            getImage(),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              width: 50,
              child: Text("#" + animal.id.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black)),
            )
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green.withOpacity(0.5),
              Colors.green,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(5.0),
      ),
    );
  }
}
