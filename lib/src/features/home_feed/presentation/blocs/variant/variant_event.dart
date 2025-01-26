part of 'variant_bloc.dart';

@immutable
sealed class VariantEvent {}

class VariantTappedRequested extends VariantEvent {
  final String questionId;
  final String selectedOption;

  VariantTappedRequested({
    required this.questionId,
    required this.selectedOption,
  });
}
