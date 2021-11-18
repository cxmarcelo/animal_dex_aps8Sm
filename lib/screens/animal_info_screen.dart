import 'package:animal_dex/components/type_tag.dart';
import 'package:animal_dex/models/animal.dart';
import 'package:animal_dex/models/arguments_animal_item.dart';
import 'package:animal_dex/services/animal_service.dart';
import 'package:animal_dex/utils/app_config.dart';
import 'package:animal_dex/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimalInfo extends StatefulWidget {
  const AnimalInfo({Key? key}) : super(key: key);

  @override
  State<AnimalInfo> createState() => _AnimalInfoState();
}

class _AnimalInfoState extends State<AnimalInfo> {
  final double fontSizeFloatingText = 14;

  void deleteAnimal(BuildContext context, Animal animal) {
    AnimalService animalService = Provider.of(context, listen: false);
    try {
      animalService.deleteAnimal(animal.id).then((value) =>
          {Navigator.of(context).pushReplacementNamed(AppRoutes.favorites)});
    } catch (e) {
      _showDialog("Erro para deletar animal favorito", "Fechar");
    }
  }

  void addAnimalFavorite(BuildContext context, Animal animal) {
    AnimalService animalService = Provider.of(context, listen: false);
    try {
      animalService
          .addAnimalFavorite(animal.id)
          .then((value) => {_showDialog("Animal Favorito Inserido", "Ok")});
    } catch (e) {
      _showDialog("Erro para favoritar animal", "Fechar");
    }
  }

  void _showDialog(String msg, String btnMsg) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text(msg),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(btnMsg))
              ],
            ));
  }

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
    final ArgumentsAnimalItem arguments =
        ModalRoute.of(context)!.settings.arguments as ArgumentsAnimalItem;
    final bool isFavorite = arguments.isFavorite;
    final Animal animal = arguments.animal;

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
        actions: [
          if (isFavorite)
            IconButton(
                icon: const Icon(Icons.delete_sharp),
                onPressed: () {
                  deleteAnimal(context, animal);
                }),
        ],
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
                  ),
                ],
              ),
            ),
            Align(
              child: Container(
                width: 50,
                height: 50,
                margin: const EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () {
                    addAnimalFavorite(context, animal);
                  },
                  child: const Icon(Icons.favorite),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
