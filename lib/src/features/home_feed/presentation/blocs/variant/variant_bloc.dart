import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'variant_event.dart';

part 'variant_state.dart';

class VariantBloc extends Bloc<VariantEvent, VariantState> {
  VariantBloc() : super(VariantInitial(index: 0)) {
    on<VariantTappedRequested>((event, emit) {
      emit(VariantInitial(index: event.index, correct: event.correct));
    });
  }
}
