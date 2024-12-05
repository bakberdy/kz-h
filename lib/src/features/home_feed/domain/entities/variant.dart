import 'package:equatable/equatable.dart';

class Variant extends Equatable{
  final String text;
  final bool correct;

  const Variant({required this.text, required this.correct});

  @override
  // TODO: implement props
  List<Object?> get props => [text];


}