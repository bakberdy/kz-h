import 'package:equatable/equatable.dart';

class Variant extends Equatable{
  final String text;
  final bool? correct;

  const Variant({required this.text, this.correct});

  @override
  List<Object?> get props => [text];
}