part of 'fire_counter_bloc.dart';

@freezed
class FireCounterEvent with _$FireCounterEvent {
  const factory FireCounterEvent.started() = _Started;
  const factory FireCounterEvent.correct() = _Correct;
  const factory FireCounterEvent.inCorrect() = _InCorrect;
}