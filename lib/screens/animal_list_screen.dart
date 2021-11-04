import 'package:animal_dex/models/animal.dart';
import 'package:animal_dex/services/animal_service.dart';
import 'package:flutter/material.dart';
import '../components/animal_item.dart';

class AnimalListScreen extends StatefulWidget {
  const AnimalListScreen({Key? key}) : super(key: key);

  @override
  State<AnimalListScreen> createState() => _AnimalListScreenState();
}

class _AnimalListScreenState extends State<AnimalListScreen> {
  bool requestError = false;

  late Future<List<Animal>> futureAnimals;

  @override
  void initState() {
    super.initState();
    futureAnimals = AnimalService().findAnimals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animais',
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
                    .map((animal) => AnimalItem(animal))
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
