import 'package:animal_dex/models/auth.dart';
import 'package:animal_dex/screens/auth_screen.dart';
import 'package:animal_dex/screens/home_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AuthOrHomePage extends StatelessWidget {
  const AuthOrHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth ? HomePage() : AuthPage();
  }
}
