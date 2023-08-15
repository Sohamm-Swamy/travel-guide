import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_class_booking/cubit/cubit_states.dart';
import 'package:master_class_booking/cubit/cubits.dart';
import 'package:master_class_booking/pages/detail_page.dart';
import 'package:master_class_booking/pages/navpages/main_page.dart';
import 'package:master_class_booking/pages/welcome.dart';

class CubitLogics extends StatefulWidget {
  const CubitLogics({super.key});

  @override
  State<CubitLogics> createState() => _CubitLogicsState();
}

class _CubitLogicsState extends State<CubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<Cubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const WelcomePage();
          }
          if (state is LoadedState) {
            return const MainPage();
          }
          if (state is DetailState) {
            return const DetailPage();
          }
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
