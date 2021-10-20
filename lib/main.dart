import 'package:animal_dex/screens/animal_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimalDex());
}

class _AnimalDexState extends State<AnimalDex> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const SizedBox(
            width: double.infinity,
            child: Text(
              'AnimalDex',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Colors.green[400],
        ),
        body: const AnimalListScreen(),
      ),
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
