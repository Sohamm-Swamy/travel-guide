import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_class_booking/cubit/cubit_states.dart';
import 'package:master_class_booking/cubit/cubits.dart';
import 'package:master_class_booking/misc/colors.dart';
import 'package:master_class_booking/widgets/app_button.dart';
import 'package:master_class_booking/widgets/large_text_data.dart';
import 'package:master_class_booking/widgets/res_button.dart';
import 'package:master_class_booking/widgets/text_data.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectstar = 4;
  int selectedindex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Cubits, CubitStates>(
      builder: ((context, state) {
        DetailState detail = state as DetailState;
        return Scaffold(
          body: SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "http://mark.bslmeiyu.com/uploads/${detail.place.img}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<Cubits>(context).goHome();
                        },
                        icon: const Icon(
                          Icons.menu,
                        ),
                        color: Colors.white,
                        iconSize: 30,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.live_help_outlined,
                        ),
                        color: Colors.white,
                        iconSize: 30,
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 330,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LargeText(
                                text: detail.place.name,
                                color: Colors.black54.withOpacity(0.8),
                                size: 35,
                              ),
                              LargeText(
                                text: "\$${detail.place.price}",
                                color: AppColors.mainColor,
                                size: 35,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  color: AppColors.mainColor),
                              const SizedBox(
                                width: 5,
                              ),
                              TextData(
                                text: detail.place.location,
                                color: AppColors.textColor1,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    Icons.star,
                                    color: detail.place.stars > index
                                        ? AppColors.starColor
                                        : AppColors.textColor2,
                                  );
                                }),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              TextData(
                                text: "(5.0)",
                                color: AppColors.textColor2,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          LargeText(
                            text: "People",
                            size: 20,
                            color: Colors.black54.withOpacity(0.8),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextData(
                            text: "Number of people in your group",
                            color: AppColors.mainTextColor,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Wrap(
                            children: List.generate(
                              5,
                              (index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedindex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: AppButton(
                                      color: selectedindex == index
                                          ? Colors.white
                                          : Colors.black,
                                      bgcolor: selectedindex == index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                      size: 50,
                                      borderColor: selectedindex == index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                      text: (index + 1).toString(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          LargeText(
                            text: "Description",
                            color: Colors.black.withOpacity(0.8),
                            size: 30,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextData(
                            text: detail.place.description,
                            color: AppColors.mainTextColor,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButton(
                        color: AppColors.textColor1,
                        bgcolor: Colors.white,
                        size: 50,
                        borderColor: AppColors.textColor1,
                        icon: Icons.favorite,
                        isIcon: true,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const ResBut(
                        isRes: true,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
