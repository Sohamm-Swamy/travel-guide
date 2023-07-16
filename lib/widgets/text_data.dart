import 'package:flutter/material.dart';

class TextData extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  const TextData(
      {super.key,
      this.size = 20,
      required this.text,
      this.color = Colors.black54});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
