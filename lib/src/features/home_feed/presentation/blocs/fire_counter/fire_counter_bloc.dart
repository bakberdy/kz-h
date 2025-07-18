import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'fire_counter_event.dart';
part 'fire_counter_state.dart';
part 'fire_counter_bloc.freezed.dart';

class FireCounterBloc extends Bloc<FireCounterEvent, FireCounterState> {
  late SharedPreferences sharedPreferences;

  Future<void> _init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    add(const FireCounterEvent.started());
  }

  FireCounterBloc() : super(const _Initial()) {
    _init();
    on<FireCounterEvent>((event, emit) {
      event.when(
        started: () async {
          // final streak = sharedPreferences.getInt('fire_series');
          emit(const FireCounterState.updated(0));
        },
        correct: () async {
          int streak = state.maybeWhen(
            initial: () => 1,
            orElse: () => 0,
            updated: (e) => e + 1,
          );
          // await sharedPreferences.setInt('fire_series', streak);
          emit(FireCounterState.updated(streak));
        },
        inCorrect: () async {
          // await sharedPreferences.setInt('fire_series', 0);
          emit(const FireCounterState.initial());
        },
      );
    });
  }
}
