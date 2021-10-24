import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AnimalDex")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
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
