import 'package:animal_dex/components/git_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Sobre")),
        backgroundColor: Colors.green[400],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 25, bottom: 25),
              height: 200,
              child: Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: const EdgeInsets.only(left: 15, right: 15, top: 5),
                child: const Text(
                  "Este trabalho tem como objetivo trazer informações e caracteristicas sobre os animais da fauna do estado de São Paulo de uma forma simples e divertida.",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  "Integrantes do Grupo:",
                  style: TextStyle(fontSize: 30, color: Colors.green[800]),
                ),
                const GitButton("Marcelo Carvalho", "cxmarcelo"),
                const GitButton("Lucas Zornoff", "LucasZornoff"),
                const GitButton("Douglas Alves", "Douglas-av"),
                const GitButton("Lucas Noberto", "LucasNoberto"),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
