import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_class_booking/cubit/cubits.dart';
import 'package:master_class_booking/misc/colors.dart';
import 'package:master_class_booking/widgets/large_text_data.dart';
import 'package:master_class_booking/widgets/res_button.dart';
import 'package:master_class_booking/widgets/text_data.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ["welcome-one.png", "welcome-two.png", "welcome-three.png"];
  List text = [
    "Mountain Hikes give an incredible sense of freedom",
    "Want an adrenaline boost? There's nothing more exciting then hiking",
    "Encourage your friends for hiking trips to store countless memories"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    // ignore: prefer_interpolation_to_compose_strings
                    image: AssetImage(
                        // ignore: prefer_interpolation_to_compose_strings
                        "assets/img/" + images[index]),
                    fit: BoxFit.cover),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 130, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const LargeText(text: "Trips"),
                        const TextData(
                          text: "Mountain",
                          size: 40,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 250,
                          child: TextData(
                            text: text[index],
                            color: AppColors.textColor2,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            BlocProvider.of<Cubits>(context).getData();
                          },
                          child: const SizedBox(
                            width: 120,
                            child: Row(
                              children: [
                                ResBut(
                                  width: 100,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 3),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                              color: index == indexDots
                                  ? AppColors.mainColor
                                  : AppColors.mainColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15)),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
