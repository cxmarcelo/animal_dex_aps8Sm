import 'package:animal_dex/components/type_tag.dart';
import 'package:animal_dex/models/animal.dart';
import 'package:animal_dex/utils/app_config.dart';
import 'package:flutter/material.dart';

class AnimalInfo extends StatelessWidget {
  final double fontSizeFloatingText = 14;

  const AnimalInfo({Key? key}) : super(key: key);

  List<TypeTag> getTypeTags(Animal animal) {
    List<TypeTag> typeTags = [];

    if (animal.type == "T") {
      typeTags.add(const TypeTag("Terreste", Colors.brown));
    } else if (animal.type == "A") {
      typeTags.add(const TypeTag("Aquático", Colors.blue));
    } else if (animal.type == "AT") {
      typeTags.add(const TypeTag("Terreste", Colors.brown));
      typeTags.add(const TypeTag("Aquático", Colors.blue));
    } else if (animal.type == "V") {
      typeTags.add(TypeTag("Voador", Colors.blue.shade100));
    } else if (animal.type == "AVT") {
      typeTags.add(const TypeTag("Aquático", Colors.blue));
      typeTags.add(const TypeTag("Terreste", Colors.brown));
      typeTags.add(TypeTag("Voador", Colors.blue.shade100));
    } else {
      typeTags.add(const TypeTag("?", Colors.green));
    }
    if (animal.poisonous) {
      typeTags.add(const TypeTag("Venenoso", Colors.purple));
    }
    return typeTags;
  }

  @override
  Widget build(BuildContext context) {
    final Animal animal = ModalRoute.of(context)!.settings.arguments as Animal;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade400,
        title: Text(
          animal.specie,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 26,
          ),
          maxLines: 1,
        ),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[800],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Image.network(
                AppConfig.apiBaseURL + '/images/' + animal.id.toString(),
              ),
              decoration: BoxDecoration(
                color: Colors.green[400],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              child: Text(
                animal.popularName,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...getTypeTags(animal),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          animal.weight.toString(),
                          style: const TextStyle(
                              fontSize: 22, color: Colors.white),
                        ),
                        Text(
                          "Peso",
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade500),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          animal.height.toString(),
                          style: const TextStyle(
                              fontSize: 22, color: Colors.white),
                        ),
                        Text(
                          "Tamanho",
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade500),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15, bottom: 10),
              margin: const EdgeInsets.only(top: 30, right: 10, left: 10),
              decoration: BoxDecoration(
                color: Colors.green[400],
                borderRadius: const BorderRadius.all(Radius.circular(35)),
              ),
              child: Column(
                children: [
                  const Text(
                    "Descrição",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                  Container(
                    height: 185,
                    padding: const EdgeInsets.all(15),
                    child: Scrollbar(
                      isAlwaysShown: true,
                      child: SingleChildScrollView(
                        child: Text(
                          animal.description,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
