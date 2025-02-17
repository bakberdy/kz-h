part of 'fire_counter_bloc.dart';

@freezed
class FireCounterState with _$FireCounterState {
  const factory FireCounterState.initial() = _Initial;
  const factory FireCounterState.updated(int count) = _Updated;
}
