import 'package:animal_dex/models/animal.dart';
import 'package:animal_dex/utils/app_config.dart';
import 'package:flutter/material.dart';

class AnimalInfo extends StatelessWidget {
  final double fontSizeFloatingText = 14;
  final EdgeInsets paddingFloatingText = EdgeInsets.all(3);

  AnimalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Animal animal = ModalRoute.of(context)!.settings.arguments as Animal;

    return Scaffold(
      appBar: AppBar(
          title: Text(
        animal.specie,
        textAlign: TextAlign.center,
      )),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[800],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                      AppConfig.apiBaseURL + '/images/' + animal.id.toString()),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              child: Text(
                animal.popularName,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40,
                  width: 110,
                  margin: EdgeInsets.fromLTRB(10, 15, 40, 10),
                  padding: paddingFloatingText,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    animal.familly.toString(),
                    style: TextStyle(
                        fontSize: fontSizeFloatingText, color: Colors.white),
                  ),
                ),
                Container(
                  height: 40,
                  width: 110,
                  margin: EdgeInsets.fromLTRB(40, 15, 10, 10),
                  padding: paddingFloatingText,
                  decoration: BoxDecoration(
                    color: animal.poisonous
                        ? Colors.deepPurpleAccent
                        : Colors.grey[800],
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    animal.poisonous ? 'Poisonous' : 'Not Poisonous',
                    style: TextStyle(
                        fontSize: fontSizeFloatingText, color: Colors.white),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 15, 40, 10),
                  padding: paddingFloatingText,
                  alignment: Alignment.center,
                  child: Text(
                    animal.weight.toString(),
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(50, 15, 10, 10),
                  padding: paddingFloatingText,
                  alignment: Alignment.center,
                  child: Text(
                    animal.height.toString(),
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 25,
                  width: 100,
                  margin: EdgeInsets.fromLTRB(5, 30, 5, 10),
                  padding: paddingFloatingText,
                  alignment: Alignment.center,
                  child: Text(
                    "Description",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            Container(
              height: 150,
              width: 200,
              margin: EdgeInsets.all(2),
              padding: paddingFloatingText,
              alignment: Alignment.topCenter,
              child: Text(
                animal.description,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
