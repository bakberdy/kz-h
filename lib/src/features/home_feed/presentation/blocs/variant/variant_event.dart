part of 'variant_bloc.dart';

@immutable
sealed class VariantEvent {}

class VariantTappedRequested extends VariantEvent{
   final bool correct;
   final int index;

  VariantTappedRequested({required this.correct, required this.index});
}
