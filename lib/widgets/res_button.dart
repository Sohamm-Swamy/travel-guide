import 'package:flutter/material.dart';
import 'package:master_class_booking/misc/colors.dart';
import 'package:master_class_booking/widgets/text_data.dart';

class ResBut extends StatelessWidget {
  final bool? isRes;
  final double? width;
  const ResBut({Key? key, this.width = 120, this.isRes = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isRes == true ? double.maxFinite : width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isRes == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isRes == true
                ? InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const TextData(
                        text: "Book Trip Now",
                        color: Colors.white,
                      ),
                    ),
                  )
                : Container(),
            Image.asset("assets/img/button-one-removebg-preview.png")
          ],
        ),
      ),
    );
  }
}
