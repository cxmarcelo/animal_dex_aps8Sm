import 'package:animal_dex/utils/app_config.dart';
import 'package:animal_dex/utils/app_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/animal.dart';

class AnimalItem extends StatelessWidget {
  final Animal animal;

  const AnimalItem(this.animal, {Key? key}) : super(key: key);

  void _selectAnimal(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.animalInfo,
      arguments: animal,
    );
  }

  List<Color> getColors() {
    List<Color> colors = [];

    if (animal.poisonous) {
      colors.add(Colors.purple.withOpacity(0.5));
    }

    if (animal.type == "T") {
      colors.add(Colors.brown);
    } else if (animal.type == "A") {
      colors.add(Colors.blue);
    } else if (animal.type == "AT") {
      colors.add(Colors.blue);
      colors.add(Colors.brown);
    } else if (animal.type == "V") {
      colors.add(Colors.blue.shade100);
    } else if (animal.type == "AVT") {
      colors.add(Colors.blue.shade100);
      colors.add(Colors.blue);
      colors.add(Colors.brown);
    } else {
      colors.add(Colors.green.withOpacity(0.5));
      colors.add(Colors.green);
    }

    if (colors.length <= 1) {
      colors.add(colors[0].withOpacity(0.5));
    }

    return colors;
  }

  Widget getImage() {
    return Image(
      image: NetworkImage(
          AppConfig.apiBaseURL + '/images/' + animal.id.toString()),
      height: 115,
      errorBuilder: (context, error, stackTrace) => const Icon(
        Icons.cancel_outlined,
        color: Colors.white,
        size: 100.0,
      ),
    );
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
            Container(
              height: 15,
              child: Text(animal.popularName,
                  style: const TextStyle(color: Colors.white, fontSize: 12)),
            ),
            Container(
              child: Center(
                child: getImage(),
              ),
              height: 120,
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
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
            colors: [...getColors()],
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
