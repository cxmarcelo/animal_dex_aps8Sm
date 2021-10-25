import 'package:animal_dex/utils/app_routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _selectAnimalListScreen(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.animalList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AnimalDex")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _selectAnimalListScreen(context);
              },
              child: Text("Animais"),
              style: ButtonStyle(),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Menu")),
            ElevatedButton(onPressed: () {}, child: Text("Sobre")),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
