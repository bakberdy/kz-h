part of 'variant_bloc.dart';

@immutable
sealed class VariantState {}

class VariantInitial extends VariantState {
  final int index;
  final bool? correct;

  VariantInitial({required this.index, this.correct});


}

