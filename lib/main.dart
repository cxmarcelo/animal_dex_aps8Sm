import 'package:animal_dex/models/auth.dart';
import 'package:animal_dex/screens/about_screen.dart';
import 'package:animal_dex/screens/animal_favorites_screen.dart';
import 'package:animal_dex/screens/animal_list_screen.dart';
import 'package:animal_dex/screens/animal_info_screen.dart';
import 'package:animal_dex/screens/auth_or_home_page.dart';
import 'package:animal_dex/screens/auth_screen.dart';
import 'package:animal_dex/screens/home_screen.dart';
import 'package:animal_dex/services/animal_service.dart';
import 'package:animal_dex/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AnimalDex());
}

class _AnimalDexState extends State<AnimalDex> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
        ChangeNotifierProxyProvider<Auth, AnimalService>(
          create: (_) => AnimalService('', 1),
          update: (ctx, auth, previus) {
            return AnimalService(auth.token ?? '', auth.id ?? 1);
          },
        ),
      ],
      child: MaterialApp(
        routes: {
          AppRoutes.initialPage: (ctx) => const AuthOrHomePage(),
          AppRoutes.auth: (ctx) => const AuthPage(),
          AppRoutes.home: (ctx) => const HomePage(),
          AppRoutes.animalInfo: (ctx) => AnimalInfo(),
          AppRoutes.animalList: (ctx) => AnimalListScreen(),
          AppRoutes.aboutInfo: (ctx) => AboutScreen(),
          AppRoutes.favorites: (ctx) => AnimalFavoritesScreen(),
        },
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
