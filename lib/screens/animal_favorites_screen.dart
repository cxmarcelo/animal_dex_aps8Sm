import 'package:animal_dex/models/animal.dart';
import 'package:animal_dex/services/animal_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/animal_item.dart';

class AnimalFavoritesScreen extends StatefulWidget {
  const AnimalFavoritesScreen({Key? key}) : super(key: key);

  @override
  State<AnimalFavoritesScreen> createState() => _AnimalFavoritesScreenState();
}

class _AnimalFavoritesScreenState extends State<AnimalFavoritesScreen> {
  bool requestError = false;

  late Future<List<Animal>> futureAnimals;

  @override
  void initState() {
    super.initState();
    AnimalService animalService = Provider.of(context, listen: false);
    futureAnimals = animalService.findAnimalsFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animais Favoritos',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.green[400],
      ),
      body: FutureBuilder<List<Animal>>(
        future: futureAnimals,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.toString()),
            );
          } else if (snapshot.hasData) {
            return GridView(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                padding: const EdgeInsets.all(15.0),
                children: snapshot.data!
                    .map((animal) => AnimalItem(animal, true))
                    .toList());
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
