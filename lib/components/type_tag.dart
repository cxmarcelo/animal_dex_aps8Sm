import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TypeTag extends StatelessWidget {
  final String label;
  final Color color;

  const TypeTag(this.label, this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 110,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(fontSize: 15, color: Colors.white),
      ),
    );
  }
}
