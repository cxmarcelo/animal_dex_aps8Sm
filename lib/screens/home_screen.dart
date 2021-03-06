import 'package:animal_dex/components/home_button.dart';
import 'package:animal_dex/utils/app_routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "AnimalDex",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        )),
        backgroundColor: Colors.green[400],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 25, bottom: 25),
              height: 200,
              child: Image.asset("images/mapa_sp.png"),
            ),
            Column(
              children: const [
                HomeButton("Animais", AppRoutes.animalList),
                HomeButton("Menu", ""),
                HomeButton("Sobre", AppRoutes.aboutInfo),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
