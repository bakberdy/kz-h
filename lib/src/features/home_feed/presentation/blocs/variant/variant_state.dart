part of 'variant_bloc.dart';

@immutable
sealed class VariantState {}

class VariantLoading extends VariantState {
   final String selectedOption;

  VariantLoading({required this.selectedOption});
}

class VariantInitial extends VariantState {}

class VariantLoaded extends VariantState {
  final List<Variant> variants;
  final Variant? correctVariant;
  final Variant selectedVariant;

  VariantLoaded(
      {required this.selectedVariant,
      this.correctVariant,
      required this.variants});
}

class VariantError extends VariantState {
  final String message;

  VariantError(this.message);
}
