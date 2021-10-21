import 'package:animal_dex/screens/animal_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimalDex());
}

class _AnimalDexState extends State<AnimalDex> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnimalListScreen(),
    );
  }
}

class AnimalDex extends StatefulWidget {
  const AnimalDex({Key? key}) : super(key: key);

  @override
  _AnimalDexState createState() {
    return _AnimalDexState();
  }
}
