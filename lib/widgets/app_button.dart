// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:master_class_booking/widgets/text_data.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  final Color color;
  String? text;
  IconData? icon;
  final Color bgcolor;
  double size;
  final Color borderColor;
  bool? isIcon;
  AppButton({
    Key? key,
    required this.color,
    this.text = "hi",
    this.icon,
    required this.bgcolor,
    required this.size,
    required this.borderColor,
    this.isIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15),
        color: bgcolor,
      ),
      child: isIcon == false
          ? Center(
              child: TextData(
              text: text!,
              color: color,
            ))
          : Center(child: Icon(icon, color: color)),
    );
  }
}
