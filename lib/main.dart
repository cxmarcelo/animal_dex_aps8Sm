import 'package:animal_dex/screens/about_screen.dart';
import 'package:animal_dex/screens/animal_list_screen.dart';
import 'package:animal_dex/screens/animal_info_screen.dart';
import 'package:animal_dex/screens/home_screen.dart';
import 'package:animal_dex/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimalDex());
}

class _AnimalDexState extends State<AnimalDex> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        AppRoutes.home: (ctx) => const HomePage(),
        AppRoutes.animalInfo: (ctx) => AnimalInfo(),
        AppRoutes.animalList: (ctx) => AnimalListScreen(),
        AppRoutes.aboutInfo: (ctx) => AboutScreen(),
      },
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
