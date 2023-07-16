import 'package:bloc/bloc.dart';
import 'package:master_class_booking/cubit/cubit_states.dart';
import 'package:master_class_booking/models/data_models.dart';
import 'package:master_class_booking/services/data_services.dart';

class Cubits extends Cubit<CubitStates> {
  Cubits({required this.data, required this.places}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  var places;

  Future<void> getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {
      print(e);
    }
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }

  goWelcome() {
    emit(WelcomeState());
  }
}
