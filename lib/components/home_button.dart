import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeButton extends StatelessWidget {
  final String label;
  final String route;

  const HomeButton(this.label, this.route, {Key? key}) : super(key: key);

  void _selectAnimalListScreen(BuildContext context) {
    Navigator.of(context).pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      child: SizedBox(
        width: 350,
        height: 70,
        child: ElevatedButton(
          onPressed: () {
            _selectAnimalListScreen(context);
          },
          child: Text(label,
              style: const TextStyle(
                fontSize: 25,
              )),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<BeveledRectangleBorder>(
              BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
                side: const BorderSide(color: Colors.white),
              ),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.green.shade400),
            elevation: MaterialStateProperty.all(30),
            shadowColor: MaterialStateProperty.all(Colors.green),
            fixedSize:
                MaterialStateProperty.all<Size>(const Size.fromWidth(300)),
          ),
        ),
      ),
    );
  }
}
